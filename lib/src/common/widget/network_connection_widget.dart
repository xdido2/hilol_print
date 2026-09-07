import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NetworkConnectionWidget extends StatefulWidget {
  const NetworkConnectionWidget({super.key, required this.child, required this.noInternetScreen});
  final Widget child;
  final Widget noInternetScreen;

  @override
  State<NetworkConnectionWidget> createState() => _NetworkConnectionWidgetState();
}

class _NetworkConnectionWidgetState extends State<NetworkConnectionWidget> {
  @override
  Widget build(BuildContext context) => switch (kDebugMode) {
    true => widget.child,
    false => widget.noInternetScreen,
  };
}
