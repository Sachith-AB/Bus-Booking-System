import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/models/user_model.dart';
import 'package:bus_booking/src/services/authentication_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'dart:convert';

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

      await authController.updateUser(collection: "Users", user: updatedUser);

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

  Future<void> addToCart(String userId, String foodId) async {
    try {
      // Fetch user data
      final userData =
          await crudController.findOne(collection: "Users", filed: userId);
      if (userData == null || userData.isEmpty) return;

      UserModel user = userData[0];
      List<dynamic> updatedCart = List.from(user.cart);
      if (!updatedCart.contains(foodId)) {
        updatedCart.add(foodId);
      }else{
        PopupWarning.Warning(
          title: "Added to Cart",
          message: "Item Already in Cart",
          type: 0,
        );
        return;
      }

      final updatedUser = UserModel.aboutMe(
        id: user.id,
        name: user.name,
        email: user.email,
        image_url: user.image_url,
        user_type: user.user_type,
        createdAt: user.createdAt,
        address: user.address,
        contact: user.contact,
        cart: updatedCart,
        favourite: user.favourite,
      );

      await authController.updateUser(collection: "Users", user: updatedUser);

      // Update SharedPreferences
      final authUser = [
        updatedUser.id.toString(),
        updatedUser.name.toString(),
        updatedUser.email.toString(),
        updatedUser.user_type.toString(),
        updatedUser.image_url.toString(),
        updatedUser.createdAt.toString(),
        updatedUser.address.toString(),
        updatedUser.contact.toString(),
        jsonEncode(updatedUser.cart),
        jsonEncode(updatedUser.favourite),
      ];
      await SharedAuthUser.saveAuthUser(authUser);

      PopupWarning.Warning(
        title: "Added to Cart",
        message: "Item added to your cart.",
        type: 0,
      );
    } catch (e) {
      PopupWarning.Warning(
        title: "Cart Update Failed",
        message: "Could not add item to cart.",
        type: 1,
      );
    }
  }
}
