import 'package:bus_booking/src/utils/color/colors.dart';
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
  final bool isRead;

  const CustomInputField ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.isValid,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.obscureText = false,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      readOnly: isRead,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: AppInputStyle.outlineInputBorder,
        enabledBorder: isValid ? AppInputStyle.outlineValidBorder : AppInputStyle.outlineInputBorder,
        focusedBorder: AppInputStyle.outlineValidBorder,
        contentPadding: AppInputStyle.contentPadding,
        filled: isValid,
        fillColor: isValid ? KColors.appPrimary.shade100 : KColors.white,
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
