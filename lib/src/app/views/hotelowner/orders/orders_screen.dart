import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/views/hotelowner/orders/component/order_component.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        "customerName": "Alice Johnson",
        "profileUrl": "https://randomuser.me/api/portraits/women/10.jpg",
        "orderTime": DateTime.now().subtract(const Duration(minutes: 15)),
        "status": "Pending",
      },
      {
        "customerName": "Bob Smith",
        "profileUrl": "https://randomuser.me/api/portraits/men/20.jpg",
        "orderTime": DateTime.now().subtract(const Duration(hours: 1, minutes: 5)),
        "status": "Processing",
      },
      {
        "customerName": "Clara Davis",
        "profileUrl": "https://randomuser.me/api/portraits/women/30.jpg",
        "orderTime": DateTime.now().subtract(const Duration(hours: 3)),
        "status": "Delivered",
      },
    ];

    return MainScaffold(
      selectedIndex: 3,
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: "Orders List",
          backgroundColor: KColors.appPrimary.shade100,
          showBackButton: false,
          showAddfoodButton: false,
          showCartButton: false,
        ),
        body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return OrderComponent(
            customerName: order["customerName"],
            profileUrl: order["profileUrl"],
            status: order["status"],
            orderTime: order["orderTime"],
          );
        },
      ),
      )
    );
  }
}
