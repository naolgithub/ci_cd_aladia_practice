// lib/components/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.hintText = '',
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Default Style',
  type: EmailTextField,
)
EmailTextField defaultCustomTextField(BuildContext context) {
  return EmailTextField(
    controller: TextEditingController(),
  );
}

@widgetbook.UseCase(
  name: 'With Hint Text',
  type: EmailTextField,
)
EmailTextField hintTextCustomTextField(BuildContext context) {
  return EmailTextField(
    controller: TextEditingController(),
    hintText: 'Enter your email here',
  );
}
