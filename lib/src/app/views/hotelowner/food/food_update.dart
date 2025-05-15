import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/hotelOwner/food/components/image_picker_card.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:flutter/material.dart';
import '../../../../common/style/app_input_style.dart';
import '../../../components/custom_dropdown.dart';


class FoodUpdatePage extends StatefulWidget {

  final Product product;

  const FoodUpdatePage({super.key, required this.product});

  @override
  State<FoodUpdatePage> createState() => _FoodUpdatePageState();
}

class _FoodUpdatePageState extends State<FoodUpdatePage> {
  // final controller = Get.put(AddFoodController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController availabilityStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
  
    nameController.text = widget.product.name;
    descriptionController.text = widget.product.description;
    priceController.text = widget.product.price.toString();
    categoryController.text = widget.product.category;
    imageUrl = widget.product.imageUrl;
    availabilityStatusController.text = widget.product.availableStatus;
  }

  


  // Placeholder: Replace with actual image picker logic
  String? imageUrl; // This will store the image path (or URL later if uploaded)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "Update Food",
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
                    initialImage: imageUrl,
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
                        isValid: true,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodIcon,
                        isRead: true,
                      ),
                      InputFieldConfig(
                        controller: descriptionController,
                        labelText: "Description",
                        hintText: "Enter food description",
                        isValid: true,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodDescriptionIcon,
                        isRead: true,
                      ),
                      InputFieldConfig(
                        controller: categoryController,
                        labelText: "Category",
                        hintText: "Enter food category",
                        isValid: true,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodPriceIcon,
                        isRead: true,
                      ),
                      InputFieldConfig(
                        controller: priceController,
                        labelText: "Price",
                        hintText: "Enter food price",
                        isValid: false,
                        onChanged: (_) {},
                        prefixIcon: AppInputStyle.foodPriceIcon,
                      ),
                      
                    ],
                  ),
                  CustomDropdown(
                    value: availabilityStatusController.text,
                    label: "Availability",
                    icon: Icons.check_circle_outline,
                    items: const ['Available', 'Not Available'],
                    onChanged: (value) {
                      setState(() {
                        availabilityStatusController.text = value ?? 'Available';
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    label: "Update Food",
                    onPressed: updateFood,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateFood() {
    final name = nameController.text.trim();
    final description = descriptionController.text.trim();
    final priceText = priceController.text.trim();
    final category = categoryController.text.trim();

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

    // controller.createFood(
    //   name: name,
    //   description: description,
    //   price: price,
    //   imageUrl: imageUrl!, // Add image picker logic later
    //   category: category,
    //   availableStatus: availabilityStatusController.text,
    // );
  }
}
