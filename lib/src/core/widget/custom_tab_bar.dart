import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabs,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.labelColor,
    this.unselectedLabelColor,
    this.dividerColor,
    this.indicatorColor,
    this.indicatorBorderRadius = const BorderRadius.all(.circular(52)),
    this.splashBorderRadius = const BorderRadius.all(.circular(16)),
    this.labelPadding = const .symmetric(vertical: 6),
    this.paddingTab = EdgeInsets.zero,
    this.margin = const .symmetric(vertical: 12, horizontal: 16),
    this.decorationBorderRadius = const BorderRadius.all(.circular(52)),
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.decorationColor,
    this.controller,
    this.onTap,
    super.key,
  });

  final List<String> tabs;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? dividerColor;

  final Color? indicatorColor;
  final BorderRadius indicatorBorderRadius;
  final BorderRadius splashBorderRadius;

  final EdgeInsetsGeometry paddingTab;
  final EdgeInsetsGeometry labelPadding;

  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry decorationBorderRadius;
  final Color? decorationColor;
  final TabBarIndicatorSize indicatorSize;
  final TabController? controller;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: margin,
    child: DecoratedBox(
      decoration: BoxDecoration(borderRadius: decorationBorderRadius, color: decorationColor ?? context.color.grey60),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        padding: paddingTab,
        labelPadding: labelPadding,

        splashBorderRadius: splashBorderRadius,

        indicatorSize: indicatorSize,
        indicator: BoxDecoration(color: indicatorColor ?? context.color.primary, borderRadius: indicatorBorderRadius),

        labelColor: labelColor ?? context.color.white,
        unselectedLabelColor: unselectedLabelColor ?? context.color.grey950,
        dividerColor: dividerColor ?? context.color.transparent,

        labelStyle: labelStyle ?? context.textTheme.interW500s14,
        unselectedLabelStyle: unselectedLabelStyle ?? context.textTheme.interW500s14,
        tabs: tabs.map(Text.new).toList(),
      ),
    ),
  );
}
