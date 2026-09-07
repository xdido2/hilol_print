import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/card_scanner_cubit.dart';
import '../cubit/card_scanner_cubit_state.dart';
import '../screen/card_scanner_screen.dart';

/// Result handed back to the add-card form when a frame is recognized.
typedef CardScanResult = ({String cardNumber, String expiry});

/// Screen-level state of [CardScannerScreen]: the scan-line animation and the
/// bridge between the widget lifecycle and [CardScannerCubit].
///
/// Everything the camera does lives in the cubit; this mixin only forwards the
/// lifecycle and the taps.
abstract class CardScannerState extends State<CardScannerScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _scanController;

  Animation<double> get scanAnimation => _scanController;

  CardScannerCubit get _cubit => context.read<CardScannerCubit>();

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400))
      ..repeat(reverse: true);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_cubit.start()));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scanController.dispose();
    super.dispose();
  }

  /// The camera handle is revoked while the app is in the background, so it is
  /// released here and reopened on the way back.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case .resumed:
        unawaited(_cubit.onAppResumed());
      case .inactive:
      case .paused:
      case .hidden:
      case .detached:
        unawaited(_cubit.onAppInactive());
    }
  }

  /// Freezes the scan line once there is nothing left to look for.
  void onScanStateChanged(CardScannerCubitState state) {
    if (state.isRecognized && _scanController.isAnimating) {
      _scanController.stop();
    } else if (!state.isRecognized && !_scanController.isAnimating) {
      _scanController.repeat(reverse: true);
    }
  }

  void onTorchTap() => unawaited(_cubit.toggleTorch());

  void onRetryTap() => unawaited(_cubit.start());

  void onOpenSettingsTap() => unawaited(_cubit.openSettings());

  void onConfirmTap(CardScannerCubitState state) {
    if (!state.isRecognized) return;
    GoRouterHelper(context).pop<CardScanResult>((cardNumber: state.scan.panNumber!, expiry: state.scan.expiry!));
  }

  void onCloseTap() => GoRouterHelper(context).pop();
}
