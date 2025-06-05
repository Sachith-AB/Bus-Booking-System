import 'package:bus_booking/src/app/models/order_model.dart';
import 'package:bus_booking/src/app/models/order_with_user_model.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final crudController = Get.put(CrudServices());
  var orders = <Order>[].obs;

  Future<List<OrderWithUser>> getOrdersWithUserDetails() async {
    try {
      final List<OrderWithUser> ordersWithUsers = [];

      final querySnapshot = await crudController.service.collection("Orders").get();
      

      for (var doc in querySnapshot.docs) {
        final order = Order.fromSnapshot(doc);
        // print("==========================================User Snapshot Data: $order");
        // 🔍 Fetch the user data using the userId from the order
        final userSnapshot = await crudController.service.collection("Users").doc(order.userId).get();
        final userData = userSnapshot.data();

        final productSnapshot = await crudController.service.collection("Foods").doc(order.productId).get();
        final productData = productSnapshot.data();
        //  print("==========================================Product Snapshot Data: ${productData.toString()}");

        if (userData != null && productData != null) {
          ordersWithUsers.add(OrderWithUser(order: order, user: userData, product: productData));
        }
      }

      // ✅ Sort by order status
      final statusPriority = ['pending', 'processing', 'delivered'];

      ordersWithUsers.sort((a, b) {
        final aIndex = statusPriority.indexOf(a.order.status?.toLowerCase() ?? 'pending');
        final bIndex = statusPriority.indexOf(b.order.status?.toLowerCase() ?? 'pending');
        return aIndex.compareTo(bIndex);
      });

      return ordersWithUsers;
    } catch (e) {
      PopupWarning.Warning(
        title: "Error ❌",
        message: "Failed to load orders with user details.",
        type: 1,
      );
      return [];
    }
  }
  void updateOrderStatus(String orderId, String status) async {
    try {
      await crudController.service.collection("Orders").doc(orderId).update({
        'status': status,
      });
    } catch (e) {
      PopupWarning.Warning(
        title: "Error ❌",
        message: "Failed to update order status.",
        type: 1,
      );
    }
  }
}