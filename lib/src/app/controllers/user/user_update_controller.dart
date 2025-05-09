import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/models/user_model.dart';
import 'package:bus_booking/src/services/authentication_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';

class UserUpdateController extends GetxController {

  final authController = Get.put(AuthenticationServices());
  final crudController = Get.put(CrudServices());

  static UserUpdateController get instace => Get.find();

  void updateUser( 
    String id,
    String name , 
    String email , 
    String imageUrl,
    String userType,
    DateTime createdAt
    ) async {

      try {
      // First, update the email in Firebase Auth
      //await authController.changeEmail(email);

      // Then, update user data in Firestore
      final updatedUser = UserModel.aboutMe(
        id: id,
        name: name,
        email: email,
        image_url: imageUrl,
        user_type: userType,
        createdAt: createdAt
      );

      await authController.updateUser(collection: "Users", user: updatedUser);

      final userData = await crudController.findOne(collection: "Users", filed: id);
      print(userData);

      if (userData != null) {
        // Save to SharedPreferences
        final authUser = [
          userData.id.toString(),
          userData.name.toString(),
          userData.email.toString(),
          userData.user_type.toString(),
          userData.image_url.toString(),
          userData.createdAt.toString()
        ];

        await SharedAuthUser.saveAuthUser(authUser);
      }
      PopupWarning.Warning(
        title: "Update Successful",
        message: "User profile updated.",
        type: 0,
      );

    } catch (e) {
      rethrow;
    }
  }
}