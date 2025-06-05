import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/controllers/hotelOwner/order_screen_controller.dart';
import 'package:bus_booking/src/app/models/order_with_user_model.dart';
import 'package:bus_booking/src/app/views/hotelowner/orders/component/order_component.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<OrderWithUser> _ordersWithUser = [];
  final controller = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    _loadOrderItems();
  }

  Future<void> _loadOrderItems() async {
    final result = await controller.getOrdersWithUserDetails();
    // print("+++++++++++++++++++++++++++++++++++Orders with User: $result");
    setState(() {
      _ordersWithUser = result;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: _ordersWithUser.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _ordersWithUser.length,
                itemBuilder: (context, index) {
                  final item = _ordersWithUser[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/order-item', arguments: item);
                      // print("Navigating to order details for order ID: ${item.order.id}");
                    },
                    child: OrderComponent(
                      customerName: item.user["name"] ?? "Customer",
                      profileUrl: item.user["image_url"] ?? "",
                      status: item.order.status ?? "pending",
                      orderTime: item.order.createdAt,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
