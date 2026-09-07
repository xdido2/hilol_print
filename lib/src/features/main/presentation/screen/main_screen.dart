import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/constant/gen/assets.gen.dart';
import '../state/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends MainScreenState {
  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = context.color.scaffoldBackground;
    final selectedColor = context.color.primary;
    final unselectedColor = context.color.grey500;
    final labelStyle = context.textTheme.interW500s10;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: context.color.transparent,
        backgroundColor: context.color.transparent,
        selectedIndex: currentIndex(context),

        onDestinationSelected: (index) => onTap(context, index),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final color = states.contains(WidgetState.selected) ? selectedColor : unselectedColor;
          return labelStyle.copyWith(color: color);
        }),
        destinations: [
          NavigationDestination(
            icon: Assets.images.home.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.home.image(width: 26, height: 26, color: selectedColor),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Assets.images.journal.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.journal.image(width: 26, height: 26, color: selectedColor),
            label: 'Journal',
          ),
          NavigationDestination(
            icon: Assets.images.profile.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.profile.image(width: 26, height: 26, color: selectedColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
