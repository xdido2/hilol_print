import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.title,
    this.backgroundColor,
    this.secondaryColor,
    this.onTap,
    this.titleColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.height = 48,
    this.width,
    this.borderRadius = const .all(.circular(56)),
    super.key,
    this.icon,
    this.titleStyle,
  });

  final Color? backgroundColor;
  final Color? secondaryColor;
  final Color? titleColor;
  final String title;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool isLoading;
  final double height;
  final double? width;
  final BorderRadiusGeometry borderRadius;
  final Widget? icon;
  final TextStyle? titleStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        widget.titleStyle ??
        context.textTheme.interW600s14.copyWith(
          color: widget.isDisabled ? context.color.grey300 : (widget.titleColor ?? context.color.white),
        );

    final bool isInteractive = !widget.isDisabled && !widget.isLoading && widget.onTap != null;

    return GestureDetector(
      onTap: isInteractive ? widget.onTap : null,
      child: SizedBox(
        height: widget.height + 3,
        width: widget.width ?? .infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.isDisabled ? context.color.grey60 : (widget.backgroundColor ?? context.color.primary),
            borderRadius: widget.borderRadius,
          ),
          child: Center(
            child: widget.isLoading
                ? const CircularProgressIndicator.adaptive()
                : widget.icon != null
                ? Row(
                    mainAxisAlignment: .center,
                    children: [
                      widget.icon!,
                      const SizedBox(width: 8),
                      Text(widget.title, style: titleStyle),
                    ],
                  )
                : Text(widget.title, style: titleStyle),
          ),
        ),
      ),
    );
  }
}
