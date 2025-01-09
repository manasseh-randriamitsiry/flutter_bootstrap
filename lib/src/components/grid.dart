import 'package:flutter/material.dart';
import '../utilities/breakpoints.dart';

class BootstrapRow extends StatelessWidget {
  final List<BootstrapColumn> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const BootstrapRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children.map((column) {
            return column.buildWithWidth(screenWidth);
          }).toList(),
        );
      },
    );
  }
}

class BootstrapColumn extends StatelessWidget {
  final Widget child;
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? xxl;

  const BootstrapColumn({
    super.key,
    required this.child,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return buildWithWidth(constraints.maxWidth);
      },
    );
  }

  Widget buildWithWidth(double screenWidth) {
    return Flexible(
      flex: _getColumnWidth(screenWidth),
      child: child,
    );
  }

  int _getColumnWidth(double screenWidth) {
    if (screenWidth >= Breakpoints.xxl && xxl != null) return xxl!;
    if (screenWidth >= Breakpoints.xl && xl != null) return xl!;
    if (screenWidth >= Breakpoints.lg && lg != null) return lg!;
    if (screenWidth >= Breakpoints.md && md != null) return md!;
    if (screenWidth >= Breakpoints.sm && sm != null) return sm!;
    return xs;
  }
} 