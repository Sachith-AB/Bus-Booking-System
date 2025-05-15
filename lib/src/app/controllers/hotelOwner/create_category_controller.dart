import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bus_booking/src/services/crud_services.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';


class AddCategoryController extends GetxController {
  final crudController = Get.put(CrudServices());

  static AddCategoryController get instance => Get.find();


  void createCategory({
  required String name,
  required IconData icon,
}) async {
  try {
    final docRef = crudController.service.collection("Categories").doc();
    final generatedId = docRef.id;
    final newCategoryData = Category(
      id: generatedId,
      name : name,
      iconCode: icon.codePoint.toString(),
      iconFontFamily: icon.fontFamily ?? 'MaterialIcons', // fallback
    );

    await crudController.insert("Categories", newCategoryData).whenComplete(() {
      PopupWarning.Warning(
        title: "Success 🎉",
        message: "Category added successfully!",
        type: 0,
      );
    });
  } catch (e) {
    print("Error: $e");
    PopupWarning.Warning(
      title: "Error ❌",
      message: e.toString(),
      type: 1,
    );
  }
}


}
