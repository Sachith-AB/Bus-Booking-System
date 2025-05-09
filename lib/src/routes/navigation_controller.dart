import 'package:get/get.dart';

class NavigationController extends GetxController {

  var selectedIndex = 1.obs;

  void changeTab(int index){
    selectedIndex.value = index;
  }
}