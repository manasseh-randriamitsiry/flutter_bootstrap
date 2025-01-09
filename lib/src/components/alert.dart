import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

enum BootstrapAlertStyle {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
}

class BootstrapAlert extends StatelessWidget {
  final String message;
  final BootstrapAlertStyle style;
  final VoidCallback? onDismiss;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const BootstrapAlert({
    super.key,
    required this.message,
    this.style = BootstrapAlertStyle.primary,
    this.onDismiss,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          if (icon != null) 
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: icon!,
            ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: _getTextColor(),
              ),
            ),
          ),
          if (onDismiss != null)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onDismiss,
              color: _getTextColor(),
            ),
        ],
      ),
    );
  }

  Color _getBaseColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (style) {
      case BootstrapAlertStyle.primary:
        return BootstrapTheme.primary;
      case BootstrapAlertStyle.secondary:
        return BootstrapTheme.secondary;
      case BootstrapAlertStyle.success:
        return BootstrapTheme.success;
      case BootstrapAlertStyle.danger:
        return BootstrapTheme.danger;
      case BootstrapAlertStyle.warning:
        return BootstrapTheme.warning;
      case BootstrapAlertStyle.info:
        return BootstrapTheme.info;
    }
  }

  Color _getBackgroundColor() {
    final baseColor = _getBaseColor();
    return Color.fromRGBO(
      baseColor.red,
      baseColor.green,
      baseColor.blue,
      0.1,
    );
  }

  Color _getBorderColor() {
    return borderColor ?? _getBaseColor();
  }

  Color _getTextColor() {
    return textColor ?? _getBaseColor();
  }
} 