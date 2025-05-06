import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:flutter/cupertino.dart';

import 'custom_input_field.dart';
import 'input_field_config.dart';

class DynamicForm extends StatelessWidget {
  final List<InputFieldConfig> fields;
  final VoidCallback onSubmit;
  final bool isLoading;
  final bool isEnabled;
  final String submitLabel;

  const DynamicForm({
    super.key,
    required this.fields,
    required this.onSubmit,
    this.isLoading = false,
    this.isEnabled = true,
    this.submitLabel = "Submit",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...fields.map((field) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: CustomInputField(
            controller: field.controller,
            hintText: field.hintText,
            labelText: field.labelText,
            isValid: field.isValid,
            onChanged: field.onChanged,
            keyboardType: field.keyboardType,
            prefixIcon: field.prefixIcon,
            obscureText: field.obscureText,
          ),
        )),
        const SizedBox(height: 10),
        PrimaryButton(
          label: submitLabel,
          isEnabled: isEnabled,
          isLoading: isLoading,
          onPressed: onSubmit,
        ),
      ],
    );
  }
}
