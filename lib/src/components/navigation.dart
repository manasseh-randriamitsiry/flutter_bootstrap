import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

class BootstrapNavbar extends StatelessWidget {
  final String title;
  final List<BootstrapNavItem> items;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;

  const BootstrapNavbar({
    super.key,
    required this.title,
    required this.items,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor ?? BootstrapTheme.light,
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? BootstrapTheme.dark,
        ),
      ),
      actions: [
        ...items.map((item) => TextButton(
          onPressed: item.onTap,
          child: Text(
            item.label,
            style: TextStyle(
              color: textColor ?? BootstrapTheme.dark,
            ),
          ),
        )),
        if (actions != null) ...actions!,
      ],
    );
  }
}

class BootstrapNavItem {
  final String label;
  final VoidCallback onTap;
  final bool active;

  const BootstrapNavItem({
    required this.label,
    required this.onTap,
    this.active = false,
  });
} 