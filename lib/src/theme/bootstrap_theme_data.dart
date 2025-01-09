import 'package:flutter/material.dart';
import 'bootstrap_theme.dart';

class BootstrapThemeData {
  final Color primary;
  final Color secondary;
  final Color success;
  final Color danger;
  final Color warning;
  final Color info;
  final Color light;
  final Color dark;
  final bool isDark;
  final double borderRadius;
  final EdgeInsets buttonPadding;
  final EdgeInsets inputPadding;
  final TextStyle headingStyle;
  final TextStyle bodyStyle;

  const BootstrapThemeData({
    this.primary = BootstrapTheme.primary,
    this.secondary = BootstrapTheme.secondary,
    this.success = BootstrapTheme.success,
    this.danger = BootstrapTheme.danger,
    this.warning = BootstrapTheme.warning,
    this.info = BootstrapTheme.info,
    this.light = BootstrapTheme.light,
    this.dark = BootstrapTheme.dark,
    this.isDark = false,
    this.borderRadius = 4.0,
    this.buttonPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.inputPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.headingStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.bodyStyle = const TextStyle(),
  });

  BootstrapThemeData copyWith({
    Color? primary,
    Color? secondary,
    Color? success,
    Color? danger,
    Color? warning,
    Color? info,
    Color? light,
    Color? dark,
    bool? isDark,
    double? borderRadius,
    EdgeInsets? buttonPadding,
    EdgeInsets? inputPadding,
    TextStyle? headingStyle,
    TextStyle? bodyStyle,
  }) {
    return BootstrapThemeData(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      light: light ?? this.light,
      dark: dark ?? this.dark,
      isDark: isDark ?? this.isDark,
      borderRadius: borderRadius ?? this.borderRadius,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      inputPadding: inputPadding ?? this.inputPadding,
      headingStyle: headingStyle ?? this.headingStyle,
      bodyStyle: bodyStyle ?? this.bodyStyle,
    );
  }
} 