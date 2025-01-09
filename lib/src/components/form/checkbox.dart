import 'package:flutter/material.dart';
import '../../theme/bootstrap_theme.dart';

class BootstrapCheckbox extends StatelessWidget {
  final String? label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool disabled;
  final String? helperText;
  final String? errorText;
  final Color? activeColor;
  final Color? checkColor;

  const BootstrapCheckbox({
    super.key,
    this.label,
    required this.value,
    this.onChanged,
    this.disabled = false,
    this.helperText,
    this.errorText,
    this.activeColor,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: value,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: value,
                  onChanged: disabled ? null : (bool? newValue) {
                    onChanged?.call(newValue ?? false);
                  },
                  activeColor: activeColor ?? BootstrapTheme.primary,
                  checkColor: checkColor ?? Colors.white,
                ),
                if (label != null)
                  Text(
                    label!,
                    style: TextStyle(
                      color: disabled ? BootstrapTheme.gray500 : null,
                    ),
                  ),
              ],
            ),
            if (helperText != null)
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  helperText!,
                  style: TextStyle(
                    color: BootstrapTheme.gray600,
                    fontSize: 12,
                  ),
                ),
              ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: BootstrapTheme.danger,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
} 