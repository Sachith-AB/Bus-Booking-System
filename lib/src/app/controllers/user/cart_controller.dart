import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final crudController = Get.put(CrudServices());

  var foods = <Product>[].obs;

  Future<RxList<Product>> getCartProduct(List<String> foodIds) async {
    try{
      foods.clear();
      for(var id in foodIds){
        final product = await crudController.findById<Product>(
          collection: "Foods", 
          docId: id, 
          fromSnapshot: (doc)=>Product.fromSnapshot(doc),
        );
        if(product != null){
          foods.add(product);
        }
      }
      return foods;
    }catch(e){
      // Optional: Show warning to user
      PopupWarning.Warning(
        title: "Something went wrong",
        message: "Couldn't load cart items. Try again.",
        type: 1,
      );
      return foods;
    }
  }
}