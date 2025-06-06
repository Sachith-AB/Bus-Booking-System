import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/models/order_model.dart';

class FoodController extends GetxController {
  final crudController = Get.put(CrudServices());

  var foods = <Product>[].obs;
  var orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllFoods();
  }

  Future<void> getAllFoods() async {
    try {
      final result = await crudController.findAll<Product>(
        collection: 'Foods',
        fromSnapshot: (doc) => Product.fromSnapshot(doc),
      );
      if (result.isNotEmpty) {
        foods.value = result.cast<Product>();
      } else {
        foods.clear();
      }
    } catch (e) {
      foods.clear();
    }
  }

  Future<void> getAllOrders() async {
    final user = SharedAuthUser.getAuthUser();
    final userId = user![0];
    try {
      final result = await crudController.findAll<Order>(
        collection: 'Orders',
        fromSnapshot: (doc) => Order.fromSnapshot(doc),
      );
      if (result.isNotEmpty) {
        // Filter orders by userId
        orders.value = result.where((order) => order.userId == userId).toList();
      } else {
        orders.clear();
      }
    } catch (e) {
      orders.clear();
    }
  }
}
