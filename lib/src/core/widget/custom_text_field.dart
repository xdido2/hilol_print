import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/extensions/extensions.dart';

const _defaultColor = Color(0xffF2F4F7);

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.style,
    this.maxLength,
    this.hintTextStyle,
    this.controller,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.hideErrorMessage = false,
    this.obscureCharacter = '*',
    this.keyboardType,
    this.textInputAction,
    this.fillColor,
    this.focusedFillColor,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.errorBorderColor,
    this.borderRadius = 10,
    this.borderWidth = 1.2,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.contentPadding,
    this.suffixText,
    this.suffixStyle,
    this.prefixText,
    this.prefixStyle,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.hint,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final Widget? hint;
  final String? hintText;
  final bool hideErrorMessage;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final String obscureCharacter;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? focusedFillColor;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final Color? errorBorderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = _errorText != null && _errorText!.isNotEmpty;

    // Border rangi: error -> errorBorderColor, qolganida har doim defaultColor
    final borderColor = hasError
        ? (widget.errorBorderColor ?? context.color.error)
        : (_isFocused
              ? widget.focusedBorderColor ?? context.color.primary
              : widget.unfocusedBorderColor ?? Colors.transparent);

    // Fill rangi: focused bo'lsa focusedFillColor, aks holda fillColor
    final currentFillColor = _isFocused
        ? (widget.focusedFillColor ?? _defaultColor.withValues(alpha: 0.38))
        : (widget.fillColor ?? _defaultColor.withValues(alpha: 0.38));

    void handleEditingComplete() {
      if (widget.textInputAction == .next) {
        FocusScope.of(context).nextFocus();
        return;
      }
      FocusScope.of(context).unfocus();
    }

    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: widget.borderWidth),
      borderRadius: .circular(widget.borderRadius),
    );

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.isObscureText,
          obscuringCharacter: widget.obscureCharacter,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: context.color.primary,
          cursorErrorColor: context.color.error,
          autofocus: widget.autofocus,
          style: widget.style ?? context.textTheme.interW400s16.copyWith(color: context.color.white),
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onEditingComplete: handleEditingComplete,

          decoration: InputDecoration(
            filled: true,
            fillColor: currentFillColor,
            isDense: true,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle ?? context.textTheme.interW400s12,
            prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),

            suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? context.color.error, width: widget.borderWidth),
              borderRadius: .circular(widget.borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? context.color.error, width: widget.borderWidth),
              borderRadius: .circular(widget.borderRadius),
            ),

            hint: widget.hint,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle:
                widget.hintTextStyle ??
                context.textTheme.interW400s14.copyWith(color: context.color.grey300.withValues(alpha: 0.3)),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle ?? context.textTheme.interW400s12,
            floatingLabelBehavior: .auto,
            floatingLabelStyle: widget.labelStyle ?? context.textTheme.interW400s12.copyWith(color: _defaultColor),
            labelStyle: widget.labelStyle ?? context.textTheme.interW400s12.copyWith(color: context.color.grey300),
            errorStyle: const TextStyle(height: 0, fontSize: 0),
          ),
          autovalidateMode: .disabled,
          validator: (value) {
            final error = widget.validator?.call(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _errorText != error) setState(() => _errorText = error);
            });
            return error;
          },
          onChanged: (v) {
            if (_errorText != null) setState(() => _errorText = null);
            widget.onChanged?.call(v);
          },
          inputFormatters: widget.inputFormatters,
        ),
        if (hasError && !widget.hideErrorMessage)
          Padding(
            padding: const .only(left: 12, top: 6),
            child: Text(_errorText!, style: TextStyle(fontSize: 12, color: context.color.error)),
          ),
      ],
    );
  }
}
