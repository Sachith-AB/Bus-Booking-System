import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/controllers/user_register_controller.dart';
import 'package:bus_booking/src/utils/validate/KValidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/constant.dart';
import '../../../components/custom_dynamic_form.dart';
import '../../../components/input_field_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  bool validEmail = false;
  bool validName = false;
  bool validPassword = false;
  bool validAddress = false;
  bool validContact = false;

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

  void onPasswordChanged(String password, String cPassword) {
    final error = KValidator.validatePassword(password, cPassword);
    setState(() {
      validPassword = error == null;
    });
  }

  void onAddressChanged(String address) {
    final error = KValidator.validateAddress(address);
    setState(() {
      validAddress = error == null;
    });
  }

  void onContactChanged(String contact) {
    final error = KValidator.validateContact(contact);
    setState(() {
      validContact = error == null;
    });
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
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(tLogo),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              const PrimaryHeader(
                text: "Create an Account",
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    DynamicForm(
                      fields: [
                        InputFieldConfig(
                          controller: nameController,
                          labelText: "Name",
                          hintText: "Sachith Avintha",
                          isValid: validName,
                          onChanged: (name) => onNameChanged(name),
                          prefixIcon: AppInputStyle.emailIcon,
                        ),
                        InputFieldConfig(
                          controller: emailController,
                          labelText: "Email",
                          hintText: "brendonmacalum@gmail.com",
                          isValid: validEmail,
                          onChanged: (email) => onEmailChanged(email),
                          prefixIcon: AppInputStyle.emailIcon,
                        ),
                        InputFieldConfig(
                          controller: passwordController,
                          labelText: "Password",
                          hintText: "Password must be 8 character",
                          isValid: validPassword,
                          onChanged: (password) => onPasswordChanged(
                              password, confirmPasswordController.text),
                          prefixIcon: AppInputStyle.emailIcon,
                          obscureText: true,
                        ),
                        InputFieldConfig(
                          controller: confirmPasswordController,
                          labelText: "Confirm Password",
                          hintText: "Re-enter password",
                          isValid: validPassword,
                          onChanged: (cPassword) => onPasswordChanged(
                              passwordController.text, cPassword),
                          prefixIcon: AppInputStyle.emailIcon,
                          obscureText: true,
                        ),
                        InputFieldConfig(
                          controller: addressController,
                          labelText: "Address",
                          hintText: "Enter your address",
                          isValid: validAddress,
                          onChanged: (address) => onAddressChanged(address),
                          prefixIcon: AppInputStyle.emailIcon,
                        ),
                        InputFieldConfig(
                          controller: contactController,
                          labelText: "Contact",
                          hintText: "Enter your contact number",
                          isValid: validContact,
                          onChanged: (contact) => onContactChanged(contact),
                          prefixIcon: AppInputStyle.emailIcon,
                        ),
                      ],
                    ),
                    PrimaryButton(
                      label: 'Register',
                      isEnabled: validEmail &&
                          validName &&
                          validPassword &&
                          validAddress &&
                          validContact,
                      isLoading: false,
                      onPressed: () {
                        registerUser();
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PrimaryHeader(
                          text: 'Have an Account',
                          color: KColors.gray,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const PrimaryHeader(
                            text: "Login",
                            color: KColors.primaryColor,
                            size: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final controller = Get.put(UserRegisterController());

  void registerUser() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final address = addressController.text.trim();
    final contact = contactController.text.trim();

    const userType = KCustomer;

    controller.registerAsUser(
        name, email, password, userType, address, contact);
  }
}
