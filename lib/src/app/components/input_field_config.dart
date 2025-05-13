import 'package:flutter/cupertino.dart';

class InputFieldConfig {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isValid;
  final void Function(String value) onChanged;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final bool obscureText;
  final bool isRead;

  InputFieldConfig({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isValid,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.obscureText = false,
    this.isRead = false,
  });
}
