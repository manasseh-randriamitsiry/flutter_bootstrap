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
    return Container(
      color: backgroundColor ?? BootstrapTheme.dark,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 16),
          ],
          Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 24),
          ...items.map((item) => _buildNavItem(item)).toList(),
          if (actions != null) ...[
            const Spacer(),
            ...actions!,
          ],
        ],
      ),
    );
  }

  Widget _buildNavItem(BootstrapNavItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: item.onTap,
        child: Text(
          item.label,
          style: TextStyle(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class BootstrapNavItem {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const BootstrapNavItem({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });
} 