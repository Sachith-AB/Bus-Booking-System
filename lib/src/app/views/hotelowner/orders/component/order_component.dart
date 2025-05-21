import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/custom_delivery_status.dart';


class OrderComponent extends StatelessWidget {
  final String customerName;
  final String profileUrl;
  final String status;
  final DateTime orderTime;

  const OrderComponent({
    super.key,
    required this.customerName,
    required this.profileUrl,
    required this.status,
    required this.orderTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profileUrl),
          radius: 25,
        ),
        title: Text(
          customerName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Ordered at: ${_formatDateTime(orderTime)}"),
        trailing: OrderStatusBadge(status: status), // Use the new component
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    return "${dt.year.toString().padLeft(4, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')} "
           "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }
}
