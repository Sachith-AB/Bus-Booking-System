import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:bus_booking/src/app/models/product_model.dart';

class AddFoodController extends GetxController {
  final crudController = Get.put(CrudServices());

  static AddFoodController get instance => Get.find();


  void createFood({
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required String category,
    required String availableStatus,
  }) async {
    try {
      // Step 1: Generate a new document reference with an auto ID
      final docRef = crudController.service.collection("Foods").doc();
      final generatedId = docRef.id;

      // Step 2: Create the product with the generated ID
      final newProduct = Product(
        id: generatedId,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
        isFavorite: false,
        category: category,
        availableStatus: availableStatus,
      );

      // Step 3: Insert with the generated ID
      await crudController.insert("Foods", newProduct).whenComplete(() {
        PopupWarning.Warning(
          title: "Success 🎉",
          message: "Food item added successfully!",
          type: 0,
        );
      });
    } catch (e) {
      print("Error: $e");
      PopupWarning.Warning(
        title: "Error ❌",
        message: "Failed to add food item.",
        type: 1,
      );
    }
  }

}
