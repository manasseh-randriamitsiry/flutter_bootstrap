import 'package:flutter/material.dart';
import 'bootstrap_theme_data.dart';

class BootstrapThemeProvider extends InheritedWidget {
  final BootstrapThemeData themeData;

  const BootstrapThemeProvider({
    super.key,
    required this.themeData,
    required super.child,
  });

  static BootstrapThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BootstrapThemeProvider>();
  }

  @override
  bool updateShouldNotify(BootstrapThemeProvider oldWidget) {
    return themeData != oldWidget.themeData;
  }
} 