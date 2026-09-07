import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/widget/custom_text_field.dart';

/// {@template card_text_field_widget}
/// Labelled input used by the add-card form so every field shares the same
/// look: grey filled box, 16 radius and a caption above it.
/// {@endtemplate}
final class CardTextFieldWidget extends StatelessWidget {
  /// {@macro card_text_field_widget}
  const CardTextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.autofocus = false,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final bool autofocus;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: .start,
    mainAxisSize: .min,
    children: [
      Text(label, style: context.textTheme.interW500s14Grey500),
      const SizedBox(height: 8),
      CustomTextField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        suffixIcon: suffixIcon,
        autofocus: autofocus,
        hintText: hintText,
        fillColor: context.color.grey60,
        focusedFillColor: context.color.grey60,
        focusedBorderColor: context.color.primary,
        style: context.textTheme.interW600s16.copyWith(letterSpacing: 0.6),
        hintTextStyle: context.textTheme.interW600s16.copyWith(color: context.color.grey400, letterSpacing: 0.6),
        borderRadius: 16,
        contentPadding: const .symmetric(horizontal: 16, vertical: 16),
      ),
    ],
  );
}
