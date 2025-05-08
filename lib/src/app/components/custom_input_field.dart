import 'package:flutter/material.dart';

import '../../common/style/app_input_style.dart';

class CustomInputField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isValid;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final Widget ? prefixIcon;
  final bool obscureText;

  const CustomInputField ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.isValid,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: isValid ? AppInputStyle.outlineInputBorder: AppInputStyle.outlineInputBorder,
        focusedBorder: AppInputStyle.outlineInputBorder,
        contentPadding: AppInputStyle.contentPadding,
        // filled: isValid,
        //fillColor: AppInputStyle.validFillColor,
        filled: true, // Always filled
        fillColor: Colors.white, // Or use AppInputStyle.fillColor if defined
        hintText: hintText,
        labelText: labelText,
        hintStyle: AppInputStyle.hintTextStyle,
        labelStyle: AppInputStyle.labelTextStyle,
        floatingLabelStyle: AppInputStyle.floatingLabelStyle,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
