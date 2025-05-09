import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/profile_image.dart';
import 'package:bus_booking/src/app/components/secondary_button.dart';
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/controllers/user/user_update_controller.dart';
import 'package:bus_booking/src/common/style/app_input_style.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/utils/validate/KValidator.dart';
import 'package:get/get.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});


  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  List<dynamic>? user;
  @override
  void initState() {
    super.initState();

    // Example default values – you should replace these with actual user data

    user = SharedAuthUser.getAuthUser();

    if (user != null && user!.length >= 5) {
      nameController.text = user![1];   // name
      emailController.text = user![2];  // email
    }

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
      validPhoneNo = error == null;
    });
  }

  void onAddressChanged(String address) {
    
  }

  @override
  Widget build(BuildContext context) {
    
    return MainScaffold(
      selectedIndex: 4,
      body: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: 'Profile',
          showBackButton: false,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade100,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  ProfileImagePicker(
                    initialImagePath: user![4],
                  ),
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
                          prefixIcon: AppInputStyle.phoneIcon,
                        ),
                        
                      ],
                      
                    ),
                    PrimaryButton(
                      label: "Update profile",
                      onPressed: () {
                        updateUser();
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
      ,
      )
    );
  }

  final controller = Get.put(UserUpdateController());

  void updateUser(){
    final id = user![0];
    final name = nameController.text.trim().toString();
    final email = emailController.text.trim().toString();
    final imageUrl = user![4];
print(user);
    //controller.updateUser(id, name, email, imageUrl);
  }
}