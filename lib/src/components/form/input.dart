import 'package:flutter/material.dart';
import '../../theme/bootstrap_theme.dart';
import 'form_controller.dart';

enum BootstrapInputSize {
  sm,
  md,
  lg,
}

class BootstrapInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final BootstrapInputSize size;
  final TextInputType? keyboardType;
  final String name;
  final BootstrapFormController? formController;

  const BootstrapInput({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.controller,
    this.size = BootstrapInputSize.md,
    this.keyboardType,
    required this.name,
    this.formController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: TextStyle(
                color: BootstrapTheme.gray700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        TextFormField(
          controller: controller,
          onChanged: (value) {
            onChanged?.call(value);
            formController?.setValue(name, value);
          },
          validator: (value) {
            final error = validator?.call(value);
            formController?.setError(name, error);
            return error;
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: placeholder,
            helperText: helperText,
            errorText: errorText,
            contentPadding: _getInputPadding(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsets _getInputPadding() {
    switch (size) {
      case BootstrapInputSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BootstrapInputSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      default:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    }
  }
} 