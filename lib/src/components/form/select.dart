import 'package:flutter/material.dart';
import '../../theme/bootstrap_theme.dart';
import 'input.dart';

class BootstrapSelectOption {
  final String value;
  final String label;

  const BootstrapSelectOption({
    required this.value,
    required this.label,
  });
}

class BootstrapSelect extends StatelessWidget {
  final String? label;
  final List<BootstrapSelectOption> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final BootstrapInputSize size;
  final String? helperText;
  final String? errorText;
  final bool disabled;

  const BootstrapSelect({
    super.key,
    this.label,
    required this.options,
    this.value,
    this.onChanged,
    this.size = BootstrapInputSize.md,
    this.helperText,
    this.errorText,
    this.disabled = false,
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
        DropdownButtonFormField<String>(
          value: value,
          onChanged: disabled ? null : onChanged,
          items: options.map((option) {
            return DropdownMenuItem(
              value: option.value,
              child: Text(option.label),
            );
          }).toList(),
          decoration: InputDecoration(
            helperText: helperText,
            errorText: errorText,
            contentPadding: _getInputPadding(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabled: !disabled,
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