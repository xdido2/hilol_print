import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entity/card_entity.dart';
import '../../domain/entity/nfc_card_entity.dart';
import '../cubit/card_cubit.dart';
import '../cubit/card_nfc_cubit.dart';
import '../formatter/card_expiry_input_formatter.dart';
import '../formatter/card_number_input_formatter.dart';
import '../screen/add_card_screen.dart';
import '../widget/nfc_read_dialog_widget.dart';
import 'card_scanner_state.dart';

/// Screen-level state of [AddCardScreen]: form controllers, field validation
/// and the entry points of the camera / NFC flows.
abstract class AddCardState extends State<AddCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final FocusNode cardNumberFocusNode = FocusNode();
  final FocusNode expiryFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(_onFieldChanged);
    expiryController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    cardNumberController
      ..removeListener(_onFieldChanged)
      ..dispose();
    expiryController
      ..removeListener(_onFieldChanged)
      ..dispose();
    cardNumberFocusNode.dispose();
    expiryFocusNode.dispose();
    super.dispose();
  }

  /// Keeps the card preview and the submit button in sync with the inputs.
  void _onFieldChanged() => setState(() {});

  String get cardNumberDigits => cardNumberController.text.onlyDigits;

  bool get isFormValid =>
      cardNumberDigits.length == CardNumberInputFormatter.panLength &&
      expiryController.text.length == CardExpiryInputFormatter.expiryLength;

  String? validateCardNumber(String? value) =>
      value.orDefault().onlyDigits.length == CardNumberInputFormatter.panLength ? null : context.l10n.cardNumberError;

  String? validateExpiry(String? value) {
    final digits = value.orDefault().onlyDigits;
    if (digits.length != 4) return context.l10n.cardExpiryError;

    final int month = .parse(digits.substring(0, 2));
    final year = 2000 + int.parse(digits.substring(2));
    final DateTime now = .now();
    final isExpired = year < now.year || (year == now.year && month < now.month);

    return month < 1 || month > 12 || isExpired ? context.l10n.cardExpiryError : null;
  }

  Future<void> onScanTap() async {
    context.hideKeyboard();
    final result = await GoRouterHelper(context).push<CardScanResult>(AppRouter.cardScanner);
    if (result == null || !mounted) return;

    _applyFormatted(cardNumberController, const CardNumberInputFormatter(), result.cardNumber);
    _applyFormatted(expiryController, const CardExpiryInputFormatter(), result.expiry);
  }

  /// Opens the NFC session and the dialog together: the session is started
  /// before the dialog so the very first `scanning` event is not missed, and
  /// stopped after it closes whichever way the user left.
  Future<void> onNfcTap() async {
    context.hideKeyboard();

    final CardNfcCubit cubit = context.read<CardNfcCubit>();
    unawaited(cubit.start());

    final NfcCardEntity? card = await NfcReadDialogWidget.show(context, cubit: cubit);
    await cubit.stop();
    if (card == null || !mounted) return;

    _applyFormatted(cardNumberController, const CardNumberInputFormatter(), card.panNumber);
    _applyFormatted(expiryController, const CardExpiryInputFormatter(), card.expiry);
  }

  void onSaveTap() {
    context.hideKeyboard();
    if (!(formKey.currentState?.validate() ?? false)) return;

    final card = CardEntity(panNumber: cardNumberDigits, cardExpire: expiryController.text);
    context.read<CardCubit>().addCard(card);
  }

  void _applyFormatted(TextEditingController controller, TextInputFormatter formatter, String value) =>
      controller.value = formatter.formatEditUpdate(.empty, TextEditingValue(text: value));
}
