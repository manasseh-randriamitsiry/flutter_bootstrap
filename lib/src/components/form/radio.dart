import 'package:flutter/material.dart';
import '../../theme/bootstrap_theme.dart';

class BootstrapRadio<T> extends StatelessWidget {
  final String? label;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final bool disabled;
  final String? helperText;
  final String? errorText;
  final Color? activeColor;

  const BootstrapRadio({
    super.key,
    this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.disabled = false,
    this.helperText,
    this.errorText,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: value,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: disabled ? null : onChanged,
                  activeColor: activeColor ?? BootstrapTheme.primary,
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