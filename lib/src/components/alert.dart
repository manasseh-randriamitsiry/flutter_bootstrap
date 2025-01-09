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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 12),
          ],
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

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (style) {
      case BootstrapAlertStyle.primary:
        return BootstrapTheme.primary.withOpacity(0.1);
      case BootstrapAlertStyle.secondary:
        return BootstrapTheme.secondary.withOpacity(0.1);
      case BootstrapAlertStyle.success:
        return BootstrapTheme.success.withOpacity(0.1);
      case BootstrapAlertStyle.danger:
        return BootstrapTheme.danger.withOpacity(0.1);
      case BootstrapAlertStyle.warning:
        return BootstrapTheme.warning.withOpacity(0.1);
      case BootstrapAlertStyle.info:
        return BootstrapTheme.info.withOpacity(0.1);
    }
  }

  Color _getBorderColor() {
    if (borderColor != null) return borderColor!;
    return _getBaseColor();
  }

  Color _getTextColor() {
    if (textColor != null) return textColor!;
    
    switch (style) {
      case BootstrapAlertStyle.warning:
        return Colors.black87;
      default:
        return _getBaseColor();
    }
  }

  Color _getBaseColor() {
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
} 