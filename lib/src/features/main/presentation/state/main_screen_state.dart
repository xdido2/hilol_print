import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../screen/main_screen.dart';

abstract class MainScreenState extends State<MainScreen> {
  int currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return switch (location) {
      _ when location.startsWith(AppRouter.home) => 0,
      _ when location.startsWith(AppRouter.journal) => 1,
      _ when location.startsWith(AppRouter.profile) => 2,
      _ => 0,
    };
  }

  void onTap(BuildContext context, int index) {
    HapticFeedback.lightImpact();
    context.go(switch (index) {
      0 => AppRouter.home,
      1 => AppRouter.journal,
      2 => AppRouter.profile,
      _ => AppRouter.home,
    });
  }
}
