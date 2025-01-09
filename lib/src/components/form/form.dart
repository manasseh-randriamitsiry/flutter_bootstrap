import 'package:flutter/material.dart';
import 'form_controller.dart';

class BootstrapForm extends StatefulWidget {
  final List<Widget> children;
  final void Function(bool)? onValidationChanged;
  final GlobalKey<FormState> formKey;
  final BootstrapFormController formController;

  const BootstrapForm({
    super.key,
    required this.children,
    this.onValidationChanged,
    required this.formKey,
    required this.formController,
  });

  @override
  State<BootstrapForm> createState() => _BootstrapFormState();
}

class _BootstrapFormState extends State<BootstrapForm> {
  bool _isValid = false;

  void _validateForm() {
    if (widget.formKey.currentState != null) {
      final isValid = widget.formKey.currentState!.validate();
      if (isValid != _isValid) {
        setState(() => _isValid = isValid);
        widget.onValidationChanged?.call(isValid);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      onChanged: _validateForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
} 