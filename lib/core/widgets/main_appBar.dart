import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.title, this.leading, this.actions});
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: leading ?? const SizedBox(),
        actions: actions,
        scrolledUnderElevation: 0,
        title: title);
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
