import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

class BootstrapModal extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final bool dismissible;
  final double? width;
  final double? maxWidth;

  const BootstrapModal({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.dismissible = true,
    this.width,
    this.maxWidth = 600,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget body,
    List<Widget>? actions,
    bool dismissible = true,
    double? width,
    double? maxWidth,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => BootstrapModal(
        title: title,
        body: body,
        actions: actions,
        dismissible: dismissible,
        width: width,
        maxWidth: maxWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? 600,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: body,
                ),
              ),
              if (actions != null) _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (dismissible)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
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
    );
  }
} 