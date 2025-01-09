import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

enum BootstrapButtonSize { sm, md, lg }
enum BootstrapButtonVariant {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  outline
}

class BootstrapButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final BootstrapButtonVariant variant;
  final BootstrapButtonSize size;
  final bool block;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const BootstrapButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = BootstrapButtonVariant.primary,
    this.size = BootstrapButtonSize.md,
    this.block = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: block ? double.infinity : null,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: _getButtonStyle(),
        child: Text(text),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    final baseColor = backgroundColor ?? _getVariantColor();
    final textColor = foregroundColor ?? _getTextColor();
    
    return ElevatedButton.styleFrom(
      backgroundColor: disabled ? Colors.grey.shade300 : baseColor,
      foregroundColor: disabled ? Colors.grey.shade600 : textColor,
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: variant == BootstrapButtonVariant.outline
            ? BorderSide(color: baseColor)
            : BorderSide.none,
      ),
    );
  }

  Color _getVariantColor() {
    switch (variant) {
      case BootstrapButtonVariant.primary:
        return BootstrapTheme.primary;
      case BootstrapButtonVariant.secondary:
        return BootstrapTheme.secondary;
      case BootstrapButtonVariant.success:
        return BootstrapTheme.success;
      case BootstrapButtonVariant.danger:
        return BootstrapTheme.danger;
      case BootstrapButtonVariant.warning:
        return BootstrapTheme.warning;
      case BootstrapButtonVariant.info:
        return BootstrapTheme.info;
      case BootstrapButtonVariant.light:
        return BootstrapTheme.light;
      case BootstrapButtonVariant.dark:
        return BootstrapTheme.dark;
      case BootstrapButtonVariant.outline:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    if (variant == BootstrapButtonVariant.outline) {
      return _getVariantColor();
    }
    switch (variant) {
      case BootstrapButtonVariant.light:
        return BootstrapTheme.dark;
      default:
        return Colors.white;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BootstrapButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BootstrapButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      default:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    }
  }
} 