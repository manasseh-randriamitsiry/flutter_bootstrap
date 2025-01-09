import 'package:flutter/material.dart';
import '../theme/bootstrap_theme.dart';

enum BootstrapInputSize { sm, md, lg }

class BootstrapInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final BootstrapInputSize size;
  final TextInputType keyboardType;
  final Color? borderColor;
  final Color? focusColor;
  final Color? textColor;
  final Color? labelColor;

  const BootstrapInput({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.size = BootstrapInputSize.md,
    this.keyboardType = TextInputType.text,
    this.borderColor,
    this.focusColor,
    this.textColor,
    this.labelColor,
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
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: placeholder,
            helperText: helperText,
            errorText: errorText,
            contentPadding: _getPadding(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: focusColor ?? BootstrapTheme.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BootstrapInputSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 8);
      case BootstrapInputSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
      default:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
    }
  }
}

class BootstrapSelect extends StatelessWidget {
  final String? label;
  final List<BootstrapSelectOption> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final BootstrapInputSize size;

  const BootstrapSelect({
    super.key,
    this.label,
    required this.options,
    this.value,
    this.onChanged,
    this.size = BootstrapInputSize.md,
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        DropdownButtonFormField<String>(
          value: value,
          items: options.map((option) {
            return DropdownMenuItem(
              value: option.value,
              child: Text(option.label),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: _getPadding(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BootstrapInputSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 8);
      case BootstrapInputSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
      default:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
    }
  }
}

class BootstrapSelectOption {
  final String value;
  final String label;

  const BootstrapSelectOption({
    required this.value,
    required this.label,
  });
} 