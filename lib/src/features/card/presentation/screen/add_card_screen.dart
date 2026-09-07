import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../cubit/card_cubit.dart';
import '../cubit/card_cubit_state.dart';
import '../formatter/card_expiry_input_formatter.dart';
import '../formatter/card_number_input_formatter.dart';
import '../state/add_card_state.dart';
import '../widget/card_action_button_widget.dart';
import '../widget/card_preview_widget.dart';
import '../widget/card_text_field_widget.dart';

/// {@template add_card_screen}
/// Add-card form: PAN and expiry inputs, plus the camera and NFC shortcuts
/// that fill them in.
/// {@endtemplate}
class AddCardScreen extends StatefulWidget {
  /// {@macro add_card_screen}
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends AddCardState {
  @override
  Widget build(BuildContext context) => BlocConsumer<CardCubit, CardCubitState>(
    listenWhen: (previous, current) => previous.status != current.status,
    buildWhen: (previous, current) => previous.status != current.status,
    listener: (context, state) {
      if (state.status.isError) {
        context.showErrorSnackBar(state.errorMessage ?? context.l10n.cardAddError);
      }
      if (state.status.isSuccess) {
        context.showSuccessSnackBar(context.l10n.cardAddSuccess);
        // `true` tells the caller its card list is stale.
        GoRouterHelper(context).pop(true);
      }
    },
    builder: (context, state) => _buildForm(context, state),
  );

  Widget _buildForm(BuildContext context, CardCubitState state) {
    final colors = context.color;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: CustomAppBar(title: l10n.cardAddTitle),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const .fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              // TODO(abdurashid): pass the detected payment system (Humo / Uzcard) into `brandLabel`.
              CardPreviewWidget(cardNumber: cardNumberController.text, expiry: expiryController.text),
              const SizedBox(height: 28),
              CardTextFieldWidget(
                label: l10n.cardNumberLabel,
                hintText: l10n.cardNumberHint,
                controller: cardNumberController,
                focusNode: cardNumberFocusNode,
                validator: validateCardNumber,
                inputFormatters: const [CardNumberInputFormatter()],
                suffixIcon: GestureDetector(
                  onTap: onScanTap,
                  behavior: .opaque,
                  child: Padding(
                    padding: const .only(left: 8, right: 14),
                    child: Icon(Icons.photo_camera_outlined, size: 22, color: colors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: CardTextFieldWidget(
                      label: l10n.cardExpiryLabel,
                      hintText: l10n.cardExpiryHint,
                      controller: expiryController,
                      focusNode: expiryFocusNode,
                      validator: validateExpiry,
                      inputFormatters: const [CardExpiryInputFormatter()],
                      textInputAction: .done,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 24),
              _OrDivider(title: l10n.commonOr),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CardActionButtonWidget(
                      icon: Icons.photo_camera_outlined,
                      title: l10n.cardScanButton,
                      onTap: onScanTap,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CardActionButtonWidget(icon: Icons.nfc_rounded, title: l10n.cardNfcButton, onTap: onNfcTap),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const .fromLTRB(16, 8, 16, 12),
          child: CustomButton(
            title: l10n.cardSaveButton,
            isDisabled: !isFormValid || state.status.isLoading,
            isLoading: state.status.isLoading,
            onTap: onSaveTap,
          ),
        ),
      ),
    );
  }
}

final class _OrDivider extends StatelessWidget {
  const _OrDivider({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const _DividerLine(),
      Padding(
        padding: const .symmetric(horizontal: 12),
        child: Text(title, style: context.textTheme.interW400s12Grey500),
      ),
      const _DividerLine(),
    ],
  );
}

final class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) => Expanded(
    child: ColoredBox(color: context.color.grey300, child: const SizedBox(height: 1)),
  );
}
