
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/models/user_model.dart';
import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/user/Home/home_screen.dart';
import 'package:bus_booking/src/services/authentication_services.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:get/get.dart';

import '../../utils/popup_warning.dart';

class UserRegisterController extends GetxController {

  final authController = Get.put(AuthenticationServices());

  final crudController = Get.put(CrudServices());

  static UserRegisterController get instance => Get.find();

  void registerAsUser(String name, String email, String password,
      String userType) async {
    try {
      final userCredential = await authController.registerUser(email, password);

      final newUser = UserModel.register(
          email: email,
          id: userCredential.user!.uid,
          image_url: tProfile,
          createdAt: DateTime.now(),
          name: name,
          user_type: userType
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
    } catch (e) {
      e;
    }
  }

  void loginAllUser(String email, String password) async {
    String userId = '';

    try {
      await authController.loginUser(email, password).then((value) {
        userId = value.user!.uid;
      });

      final userData = await crudController.findOne(
          collection: "Users", filed: userId);

      if (userData != null) {
        PopupWarning.Warning(
          title: "Congratulations! 🎉",
          message: "Login Successful!",
          type: 0,
        );

        Get.offAll(
          () => const HomePage(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      }
      

      if(userData != null){
        final authUser = [
          userData[0].id.toString(),
          userData[0].name.toString(),
          userData[0].email.toString(),
          userData[0].user_type.toString(),
          userData[0].image_url.toString()
        ];
        await SharedAuthUser.saveAuthUser(authUser);
      }

    } catch (e) {
      e;
    }
  }
}
