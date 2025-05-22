import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userType = ''.obs;
  var authUser = Rxn<List<dynamic>>();
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    await SharedAuthUser.init();
    final userData = SharedAuthUser.getAuthUser();
    if (userData != null) {
      print("✅ Loaded User Data: $userData");
      authUser.value = userData;
      userType.value = userData[3]; // assuming index 3 is user_type
      isLoaded.value = true;
      
    } else {
      print("⚠️ No user found in SharedAuthUser");
    }
  }
}
