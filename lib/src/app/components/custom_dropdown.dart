import 'package:flutter/material.dart';
import '../../utils/color/colors.dart';

import '../../common/style/app_input_style.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String label;
  final IconData icon;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: KColors.primaryColor),
        focusColor: KColors.appPrimary,
        border: AppInputStyle.outlineInputBorder,
        focusedBorder: AppInputStyle.outlineInputBorder,
        contentPadding: AppInputStyle.contentPadding,
        labelStyle: AppInputStyle.labelTextStyle,
        floatingLabelStyle: AppInputStyle.floatingLabelStyle,
        hintStyle: AppInputStyle.hintTextStyle,
        filled: true,
        fillColor: KColors.appPrimary.shade100
        
      ),
      value: value,
      items: items.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: AppInputStyle.dropdownItemTextStyle,
          ),
        )).toList(),

      onChanged: onChanged,
    );
  }
}
