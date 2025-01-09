import 'package:flutter/material.dart';
import '../components/modal.dart';

Future<T?> showBootstrapModal<T>({
  required BuildContext context,
  required Widget body,
  String? title,
  List<Widget>? actions,
  VoidCallback? onClose,
  double? width,
  Color? backgroundColor,
  Color? titleColor,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => BootstrapModal(
      title: title,
      body: body,
      actions: actions,
      onClose: onClose ?? () => Navigator.of(context).pop(),
      width: width,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
    ),
  );
} 