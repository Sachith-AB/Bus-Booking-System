import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/profile_image.dart';
import 'package:bus_booking/src/app/components/secondary_button.dart';
import 'package:bus_booking/src/common/style/app_input_style.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/validate/KValidator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
void initState() {
  super.initState();

  // Example default values – you should replace these with actual user data
  nameController.text = "John Doe";
  emailController.text = "johndoe@example.com";
  phoneNoController.text = "0712345678";
  addressController.text = "123 Main Street, Colombo";
}


  bool validEmail = false;
  bool validName = false;
  bool validPhoneNo = false;

  void onNameChanged(String name) {
    final error = KValidator.validateName(name);
    setState(() {
      validName = error == null;
    });
  }

  void onEmailChanged(String email) {
    setState(() {
      validEmail = KValidator.validateEmail(email);
    });
  }

  void onPhoneNoChanged(String phoneNo) {
    final error = KValidator.validatePhoneNo(phoneNo);
    setState(() {
      validEmail = error == null;
    });
  }

  void onAddressChanged(String address) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                children: [
                  const SizedBox(height: 35),
                  const ProfileImagePicker(),
                  const SizedBox(height: 35),
                  DynamicForm(
                      fields: [
                        InputFieldConfig(
                          controller: nameController,
                          labelText: "Full Name",
                          hintText: "Enter Food Name",
                          isValid: validName,
                          onChanged: (name) => onNameChanged(name),
                          prefixIcon: AppInputStyle.personIcon,
                        ),
                        InputFieldConfig(
                          controller: emailController,
                          labelText: "Email",
                          hintText: "Enter email",
                          isValid: validEmail,
                          onChanged: (description) => onEmailChanged(description),
                          prefixIcon: AppInputStyle.emailIcon,
                        ),
                        InputFieldConfig(
                          controller: phoneNoController,
                          labelText: "Phone Number",
                          hintText: "Enter Phone Number",
                          isValid: validPhoneNo,
                          onChanged: (phoneNo) => onPhoneNoChanged(phoneNo),
                          prefixIcon: AppInputStyle.phoneIcon,
                        ),
                        InputFieldConfig(
                          controller: addressController,
                          labelText: "Home Address",
                          hintText: "Enter home address",
                          isValid: false,
                          onChanged: (address) => onAddressChanged(address),
                          prefixIcon: AppInputStyle.AddressIcon,
                        ),
                        
                      ],
                      submitLabel: "Update Profile",
                            onSubmit: () {
                              
                            },
                    ),
                    const SizedBox(height: 25),
                    SecondaryButton(
                      label: "Cancel",
                      onPressed: () {
                        // Handle cancel action here
                      },
                    ),
                ]
                )
              )
            ]
          )
        )
      ),
    );
  }
}