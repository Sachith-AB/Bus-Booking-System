import 'package:get/get.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';

class UpdateFoodController extends GetxController {
  final CrudServices _crudService = CrudServices();

  void updateFood({
    required String id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required String category,
    required String availableStatus,
    
  }) async {
    try {
      final updatedProduct = Product(
        id: id,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
        category: category,
        availableStatus: availableStatus,
        isFavorite: false
        
      );

      await _crudService.update(
        collection: 'Foods',
        documentId: updatedProduct.id,
        data: updatedProduct,
      ).whenComplete(() {
        PopupWarning.Warning(
          title: "Success 🎉",
          message: "Food item updated successfully!",
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
