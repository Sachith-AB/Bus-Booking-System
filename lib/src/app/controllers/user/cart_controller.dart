import 'dart:ffi';

import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final user = SharedAuthUser.getAuthUser(); 
  final crudController = Get.put(CrudServices());

  void getCartProduct(Array foodId){
    
  }
}