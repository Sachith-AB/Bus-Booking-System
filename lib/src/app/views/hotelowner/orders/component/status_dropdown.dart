import 'package:bus_booking/src/app/components/custom_dropdown.dart';
import 'package:flutter/material.dart';


class OrderStatusDropdown extends StatelessWidget {
  final String? currentStatus;
  final ValueChanged<String?> onStatusChanged;

  const OrderStatusDropdown({
    super.key,
    required this.currentStatus,
    required this.onStatusChanged,
  });

  static const List<String> statusList = [
    "pending",
    "processing",
    "delivered",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      value: currentStatus,
      items: statusList,
      onChanged: onStatusChanged,
      label: "Order Status",
      icon: Icons.info_outline,
    );
  }
}
