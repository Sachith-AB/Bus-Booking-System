import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
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
  void onDescriptionChanged(String description){

  }
  void onPriceChanged(String price){

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryHeader(text: "Add a Food"),

              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    const ImagePickerCard(),

                    const SizedBox(height: 20),
                    DynamicForm(
                      fields: [
                        InputFieldConfig(
                          controller: nameController,
                          labelText: "Name",
                          hintText: "Enter Food Name",
                          isValid: false,
                          onChanged: (name) => onNameChanged(name),
                          prefixIcon: AppInputStyle.foodIcon,
                        ),
                        InputFieldConfig(
                          controller: descriptionController,
                          labelText: "Description",
                          hintText: "Enter food description",
                          isValid: false,
                          onChanged: (description) => onDescriptionChanged(description),
                          prefixIcon: AppInputStyle.foodDescriptionIcon,
                        ),
                        InputFieldConfig(
                          controller: priceController,
                          labelText: "Price",
                          hintText: "Enter food price",
                          isValid: false,
                          onChanged: (price) => onPriceChanged(price),
                          prefixIcon: AppInputStyle.foodPriceIcon,
                        ),
                        
                      ],
                      
                    ),
                    const SizedBox(height: 30),
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
                  ]
                )
              )
            ],
          ),
        )
      ),
    );
  }
}
