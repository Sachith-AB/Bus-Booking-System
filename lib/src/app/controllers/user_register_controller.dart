import 'package:bus_booking/src/app/models/user_model.dart';
import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/services/authentication_services.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:get/get.dart';

import '../../utils/popup_warning.dart';

class UserRegisterController extends GetxController {

  final authController = Get.put(AuthenticationServices());

  final crudController = Get.put(CrudServices());

  static UserRegisterController get instance => Get.find();

  void registerAsUser(
      String name,String email, String password, String user_type
      ) async {
    try{

      final userCredential = await authController.registerUser(email, password);

      final newUser = UserModel.register(
        email:email,
        id:userCredential.user!.uid,
        name:name,
        user_type:user_type
      );

      await authController.insertUser(collection: "Users", user: newUser)
          .whenComplete(() {
        PopupWarning.Warning(
          title: "Congratulations! 🎉",
          message: "Your account has been created!",
          type: 0,
        );
      });

      Get.offAll(
            () => const LoginPage(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500),
      );

    }catch(e){

    }
  }
}
