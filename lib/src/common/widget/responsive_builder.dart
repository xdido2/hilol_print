import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatefulWidget {
  const ResponsiveBuilder({super.key, required this.onMobile, required this.onTablet, required this.onDesktop});
  final Widget Function(BuildContext context) onMobile;
  final Widget Function(BuildContext context) onTablet;
  final Widget Function(BuildContext context) onDesktop;

  @override
  State<ResponsiveBuilder> createState() => _ResponsiveBuilderState();
}

class _ResponsiveBuilderState extends State<ResponsiveBuilder> {
  @override
  Widget build(BuildContext context) => const Placeholder();
}
