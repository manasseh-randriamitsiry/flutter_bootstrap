import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

class BootstrapModal extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final double? width;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final Color? titleColor;

  const BootstrapModal({
    super.key,
    this.title,
    required this.body,
    this.actions,
    this.width,
    this.onClose,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor ?? BootstrapTheme.dark,
                        ),
                      ),
                    ),
                    if (onClose != null)
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: onClose,
                        color: Colors.grey,
                      ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            ),
            if (actions != null)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }
} 