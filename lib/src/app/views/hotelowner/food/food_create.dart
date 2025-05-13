import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/controllers/hotelOwner/create_food_controller.dart';
import 'package:bus_booking/src/app/views/hotelOwner/food/components/image_picker_card.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../components/custom_dropdown.dart';


class FoodCreatePage extends StatefulWidget {
  const FoodCreatePage({super.key});

  @override
  State<FoodCreatePage> createState() => _FoodCreatePageState();
}

class _FoodCreatePageState extends State<FoodCreatePage> {
  final controller = Get.put(AddFoodController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController CategoryController = TextEditingController();

  String availabilityStatus = 'Available';

  // Placeholder: Replace with actual image picker logic
  String? imageUrl; // This will store the image path (or URL later if uploaded)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "Add Food",
        backgroundColor: KColors.appPrimary.shade100,
        showBackButton: true,
        showAddfoodButton: false,
        showCartButton: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const PrimaryHeader(text: "Add a Food"),
            const SizedBox(height: 45),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  ImagePickerCard(
                    onImageSelected: (path) {
                        setState(() {
                          imageUrl = path;
                        });
                    },
                  ), // Currently just UI
                  const SizedBox(height: 20),
                  DynamicForm(
                    fields: [
                      InputFieldConfig(
                        controller: nameController,
                        labelText: "Name",
                        hintText: "Enter Food Name",
                        isValid: false,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodIcon,
                      ),
                      InputFieldConfig(
                        controller: descriptionController,
                        labelText: "Description",
                        hintText: "Enter food description",
                        isValid: false,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodDescriptionIcon,
                      ),
                      InputFieldConfig(
                        controller: priceController,
                        labelText: "Price",
                        hintText: "Enter food price",
                        isValid: false,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodPriceIcon,
                      ),
                      InputFieldConfig(
                        controller: CategoryController,
                        labelText: "Category",
                        hintText: "Enter food category",
                        isValid: false,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodPriceIcon,
                      ),
                    ],
                  ),
                  CustomDropdown(
                    value: availabilityStatus,
                    label: "Availability",
                    icon: Icons.check_circle_outline,
                    items: const ['Available', 'Not Available'],
                    onChanged: (value) {
                      setState(() {
                        availabilityStatus = value ?? 'Available';
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    label: "Add Food",
                    onPressed: addFood,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addFood() {
    final name = nameController.text.trim();
    final description = descriptionController.text.trim();
    final priceText = priceController.text.trim();
    final category = CategoryController.text.trim();

    if (name.isEmpty || description.isEmpty || priceText.isEmpty || category.isEmpty || imageUrl == null) {
      PopupWarning.Warning(
        title: "Missing Fields",
        message: "Please fill in all fields.",
        type: 1,
      );
      return;
    }

    final price = double.tryParse(priceText);
    if (price == null) {
      PopupWarning.Warning(
        title: "Invalid Price",
        message: "Please enter a valid number for price.",
        type: 1,
      );
      return;
    }

    controller.createFood(
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl!, // Add image picker logic later
      category: category,
      availableStatus: availabilityStatus,
    );
  }
}
