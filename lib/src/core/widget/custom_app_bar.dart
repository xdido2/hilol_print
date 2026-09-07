import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

final class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.onBackTap,
    this.actions = const <Widget>[],
    this.backgroundColor,
  });

  final String title;
  final Widget? leading;
  final VoidCallback? onBackTap;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const .fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final textTheme = context.textTheme;

    final effectiveLeading =
        leading ??
        (onBackTap == null && !Navigator.of(context).canPop()
            ? null
            : Padding(
                padding: const .only(left: 16),
                child: CustomAppBarIconButton(
                  icon: Icons.chevron_left,
                  onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
                ),
              ));

    return AppBar(
      backgroundColor: backgroundColor ?? colors.scaffoldBackground,
      surfaceTintColor: colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title, style: textTheme.sfProDisplayW700s20),
      leadingWidth: 60,
      leading: effectiveLeading,
      actions: actions.isEmpty
          ? null
          : [
              Padding(
                padding: const .only(right: 16),
                child: Row(mainAxisSize: .min, children: actions),
              ),
            ],
    );
  }
}

final class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Ink(
        width: 44,
        height: 44,
        decoration: BoxDecoration(color: backgroundColor ?? colors.grey60, shape: .circle),
        child: Center(child: Icon(icon, color: iconColor ?? colors.black)),
      ),
    );
  }
}
