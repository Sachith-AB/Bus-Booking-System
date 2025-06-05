import 'package:bus_booking/src/app/models/order_model.dart';

class OrderWithUser {
  final Order order;
  final Map<String, dynamic> user; // Adjust if you have a proper User model
  final Map<String, dynamic>? product; // Optional, if you want to include product details

  OrderWithUser({
    required this.order,
    required this.user,
    this.product,
  });
}
