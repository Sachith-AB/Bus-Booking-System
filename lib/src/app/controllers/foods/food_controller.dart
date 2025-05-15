import 'package:bus_booking/src/services/crud_services.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/app/models/product_model.dart';

class FoodController extends GetxController {
  final crudController = Get.put(CrudServices());

  var foods = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllFoods();
  }

  Future<void> getAllFoods() async {
    try {
      final result = await crudController.findAll(collection: 'Foods');
      if (result.isNotEmpty) {
        foods.value = result.cast<Product>();
        print(result);
      } else {
        foods.clear();
      }
    } catch (e) {
      foods.clear();
    }
  }
  
}
