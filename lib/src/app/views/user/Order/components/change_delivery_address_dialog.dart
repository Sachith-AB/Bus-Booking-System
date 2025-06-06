import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

Future<String?> showChangeDeliveryAddressDialog(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  return showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Enter Delivery Address'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Enter new delivery address'),
        maxLines: 3,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Return null
          style: TextButton.styleFrom(
            foregroundColor: KColors.appPrimary, // primary color
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newAddress = controller.text.trim();
            if (newAddress.isNotEmpty) {
              Navigator.pop(context, newAddress); // Return new address
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: KColors.appPrimary, // primary color
          ),
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
