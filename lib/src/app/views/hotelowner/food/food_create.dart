import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/constant.dart';
import '../../../components/custom_input_field.dart';
import '../../../components/custom_dropdown.dart';
import '../components/image_picker_card.dart';

class FoodCreatePage extends StatefulWidget {
  const FoodCreatePage({super.key});

  @override
  State<FoodCreatePage> createState() => _FoodCreatePageState();
}

class _FoodCreatePageState extends State<FoodCreatePage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController availabilityStatusController = TextEditingController();

  String availabilityStatus = 'Available';



  void onNameChanged(String name) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
          //add go back function here
          Get.back();
        },
            icon: const Icon(Icons.arrow_back_ios_new_rounded
            )
        )
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PrimaryHeader(text: "Add a Food"),

              const SizedBox(height: 20),
              const ImagePickerCard(),

              const SizedBox(height: 20),
              CustomInputField(
                controller: nameController,
                hintText: "Enter food name",
                labelText: "Name",
                isValid: true,
                onChanged: (_) {},
                prefixIcon: AppInputStyle.foodIcon,
              ),
              const SizedBox(height: 15),
              CustomInputField(
                controller: descriptionController,
                hintText: "Enter description",
                labelText: "Description",
                isValid: true,
                onChanged: (_) {},
                prefixIcon: AppInputStyle.foodDescriptionIcon,
              ),
              const SizedBox(height: 15),
              CustomInputField(
                controller: priceController,
                hintText: "Enter price",
                labelText: "Price (LKR)",
                isValid: true,
                onChanged: (_) {},
                keyboardType: TextInputType.number,
                prefixIcon: AppInputStyle.foodPriceIcon,
              ),
              const SizedBox(height: 15),
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
                onPressed: () {
                  // Handle food submission here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
