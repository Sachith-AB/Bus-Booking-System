import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:bus_booking/src/app/models/order_model.dart';

class AddOrderController extends GetxController {
  final crudController = Get.put(CrudServices());

  static AddOrderController get instance => Get.find();

  void createOrder({
    required String userId,
    required String productId,
    required double quantity,
    required String deliveryAddress,
    required String uniqueId,
    int deliveryFee = 0,
  }) async {
    try {
      // Step 1: Generate a new document reference with an auto ID
      final docRef = crudController.service.collection("Orders").doc();
      final generatedId = docRef.id;

      // Step 2: Create the order with the generated ID
      final newOrder = Order(
        id: generatedId,
        userId: userId,
        productId: productId,
        quantity: quantity,
        deliveryAddress: deliveryAddress,
        uniqueId: uniqueId,
        deliveryFee: deliveryFee, // Default delivery fee, can be modified later
      );

      // Step 3: Insert with the generated ID
      await crudController.insert("Orders", newOrder).whenComplete(() {
        PopupWarning.Warning(
          title: "Success 🎉",
          message: "Order created successfully!",
          type: 0,
        );
      });
    } catch (e) {
      PopupWarning.Warning(
        title: "Error ❌",
        message: "Failed to create order.",
        type: 1,
      );
    }
  }
}

