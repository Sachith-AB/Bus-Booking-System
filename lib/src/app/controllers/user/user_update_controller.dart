import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/models/user_model.dart';
import 'package:bus_booking/src/services/authentication_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';

class UserUpdateController extends GetxController {
  final authController = Get.put(AuthenticationServices());
  final crudController = Get.put(CrudServices());

  static UserUpdateController get instance => Get.find();

  void updateUser(
    String id,
    String name,
    String email,
    String imageUrl,
    String userType,
    DateTime createdAt,
    String address,
    String contact,
  ) async {
    try {
      final updatedUser = UserModel.aboutMe(
        id: id,
        name: name,
        email: email,
        image_url: imageUrl,
        user_type: userType,
        createdAt: createdAt,
        address: address,
        contact: contact,
      );
print(updatedUser);
      //await authController.updateUser(collection: "Users", user: updatedUser);

      final userData =
          await crudController.findOne(collection: "Users", filed: id);

      if (userData != null) {
        final authUser = [
          userData[0].id.toString(),
          userData[0].name.toString(),
          userData[0].email.toString(),
          userData[0].user_type.toString(),
          userData[0].image_url.toString(),
          userData[0].createdAt.toString(),
          userData[0].address.toString(),
          userData[0].contact.toString(),
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
