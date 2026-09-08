import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/nfc_read_event.dart';
import '../../domain/usecase/dispose_nfc_reader_use_case.dart';
import '../../domain/usecase/observe_nfc_read_use_case.dart';
import '../../domain/usecase/start_nfc_session_use_case.dart';
import '../../domain/usecase/stop_nfc_session_use_case.dart';
import 'card_nfc_cubit_state.dart';

/// Owns the NFC session of the add-card form: opens it, translates the reader's
/// events into a [Status] the dialog can render, and keeps the card once one
/// has been read.
///
/// Nothing platform-specific reaches this class — the plugin stops at the data
/// source, exactly like the `camera` package stops at [CardScannerCubit].
final class CardNfcCubit extends Cubit<CardNfcCubitState> {
  CardNfcCubit({
    required ObserveNfcReadUseCase observeNfcReadUseCase,
    required StartNfcSessionUseCase startNfcSessionUseCase,
    required StopNfcSessionUseCase stopNfcSessionUseCase,
    required DisposeNfcReaderUseCase disposeNfcReaderUseCase,
  }) : _observeNfcReadUseCase = observeNfcReadUseCase,
       _startNfcSessionUseCase = startNfcSessionUseCase,
       _stopNfcSessionUseCase = stopNfcSessionUseCase,
       _disposeNfcReaderUseCase = disposeNfcReaderUseCase,
       super(const CardNfcCubitState());

  final ObserveNfcReadUseCase _observeNfcReadUseCase;
  final StartNfcSessionUseCase _startNfcSessionUseCase;
  final StopNfcSessionUseCase _stopNfcSessionUseCase;
  final DisposeNfcReaderUseCase _disposeNfcReaderUseCase;

  StreamSubscription<NfcReadEvent>? _subscription;

  /// Opens a session, resetting whatever the previous attempt left behind.
  ///
  /// Also the retry entry point: a fresh state is emitted rather than
  /// `copyWith`, because `copyWith` cannot clear [CardNfcCubitState.card].
  Future<void> start() async {
    if (state.status.isLoading) return;
    emit(const CardNfcCubitState(status: .loading));

    // Re-subscribed on every start: the data source hands out a new reader —
    // and therefore a new stream — after a dispose.
    await _subscription?.cancel();
    _subscription = _observeNfcReadUseCase().listen(_onEvent);

    try {
      await _startNfcSessionUseCase();
    } on Exception catch (e) {
      if (!isClosed) emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }

  /// Closes the session but keeps the result: the form reads the card out of
  /// the dialog after this has run.
  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
    await _stopNfcSessionUseCase();
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    _subscription = null;
    // Also stops an open session — the reader shuts one down on its way out.
    await _disposeNfcReaderUseCase();
    return super.close();
  }

  void _onEvent(NfcReadEvent event) {
    if (isClosed) return;

    switch (event) {
      case NfcReadIdle():
        // The session ended on its own terms; leaving the last state in place
        // keeps a success or an error on screen until the user dismisses it.
        break;
      case NfcReadInProgress():
        if (!state.status.isLoading) emit(state.copyWith(status: .loading, errorMessage: null));
      case NfcReadSucceeded(:final card):
        emit(CardNfcCubitState(status: .success, card: card));
        unawaited(stop());
      case NfcReadFailed(:final exception):
        emit(CardNfcCubitState(status: .error, errorMessage: exception.toString()));
    }
  }
}
