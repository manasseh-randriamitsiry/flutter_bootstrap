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
    return child;
  }

  Widget buildWithWidth(double screenWidth) {
    final size = screenWidth.screenSize;
    final columns = _getColumnsForSize(size);
    
    return Flexible(
      flex: columns,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: child,
      ),
    );
  }

  int _getColumnsForSize(BootstrapScreenSize size) {
    switch (size) {
      case BootstrapScreenSize.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs;
      case BootstrapScreenSize.xl:
        return xl ?? lg ?? md ?? sm ?? xs;
      case BootstrapScreenSize.lg:
        return lg ?? md ?? sm ?? xs;
      case BootstrapScreenSize.md:
        return md ?? sm ?? xs;
      case BootstrapScreenSize.sm:
        return sm ?? xs;
      case BootstrapScreenSize.xs:
        return xs;
    }
  }
} 