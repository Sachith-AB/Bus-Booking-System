import 'package:bus_booking/src/services/crud_services.dart';
import 'package:get/get.dart';
import '../../../services/order_services.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  final OrderService _orderService = OrderService();
  final CrudServices _crudServices = CrudServices();
  var order = Rxn<Order>();
  var isLoading = false.obs;

  Future<void> fetchOrder(String uniqueId) async {
    isLoading.value = true;
    final data = await _orderService.getOrderById(uniqueId);
    if (data != null) {
      order.value = Order.fromMap(data);
    } else {
      order.value = null;
    }
    isLoading.value = false;
  }

  Future<void> findProduct(String id) async {
    isLoading.value = true;
    final data = await _crudServices.findOne(collection: "Foods", filed: id);
    if (data != null) {
      order.value = Order.fromMap(data);
    } else {
      order.value = null;
    }
    isLoading.value = false;
  }
}
