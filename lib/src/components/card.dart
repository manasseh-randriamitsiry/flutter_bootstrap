import 'package:flutter/material.dart';

class BootstrapCard extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final double? width;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  const BootstrapCard({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.width,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final border = borderColor ?? Colors.grey.shade300;
    
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        border: Border.all(
          color: border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null)
            Container(
              padding: padding,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: border,
                    width: 1,
                  ),
                ),
              ),
              child: header!,
            ),
          Padding(
            padding: padding,
            child: body,
          ),
          if (footer != null)
            Container(
              padding: padding,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: border,
                    width: 1,
                  ),
                ),
              ),
              child: footer!,
            ),
        ],
      ),
    );
  }
} 