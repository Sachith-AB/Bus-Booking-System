import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/controllers/hotelOwner/order_screen_controller.dart';
import 'package:bus_booking/src/app/models/order_with_user_model.dart';
import 'package:bus_booking/src/app/views/hotelowner/orders/component/status_dropdown.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersItemPage extends StatefulWidget {
  const OrdersItemPage({super.key, required this.order});

  final OrderWithUser order;

  @override
  State<OrdersItemPage> createState() => _OrdersItemPageState();
}

class _OrdersItemPageState extends State<OrdersItemPage> {
  final controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    final order = widget.order.order;
    final user = widget.order.user;
    final product = widget.order.product;
    

    return MainScaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
            title: "Order Details",
            backgroundColor: KColors.appPrimary.shade100,
            showBackButton: true,
            showAddfoodButton: false,
            showCartButton: false,
          ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CUSTOMER DETAILS
              const Text("Customer Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildDetailRow("Name", user['name'] ?? "N/A"),
              _buildDetailRow("Email", user['email'] ?? "N/A"),
              _buildDetailRow("Contact", user['contact'] ?? "N/A"),

              const SizedBox(height: 16),

              // ORDER DETAILS
              const Text("Order Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildDetailRow("Order ID", order.uniqueId),
              if (product != null) ...[
                _buildDetailRow("Product Name", product['name'] ?? "N/A"),
                _buildDetailRow("Product Price", "Rs. ${product['price'] ?? 'N/A'}"),
              ],
              _buildDetailRow("Quantity", order.quantity.toString()),
              const SizedBox(height: 8),
              const Text("Change Order Status", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              OrderStatusDropdown(
                currentStatus: order.status,
                onStatusChanged: (newStatus) {
                  if (newStatus != null) {
                    setState(() {
                      order.status = newStatus;
                    });
                    // Update the order status in the backend
                    controller.updateOrderStatus(order.id, newStatus);

                    PopupWarning.Warning(
                      title: "Success 🎉",
                      message: "Order status updated successfully!",
                      type: 0,
                    );
                    Get.toNamed('/orders');
                  }
                },
              ),
              _buildDetailRow("Delivery Fee", "Rs. ${order.deliveryFee}"),
              _buildDetailRow(
                "Delivery Address",
                (order.deliveryAddress != null && order.deliveryAddress.trim().isNotEmpty)
                    ? order.deliveryAddress
                    : (user['address'] ?? "N/A"),
              ),
              _buildDetailRow("Created At", order.createdAt.toString()),

              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 140, child: Text("$title:", style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

