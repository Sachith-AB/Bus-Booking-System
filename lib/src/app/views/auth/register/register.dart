import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/validate/KValidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/constant.dart';
import '../../../components/custom_input_field.dart';

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

  bool validEmail = false;
  bool validName = false;
  bool validPassword = false;

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

  void onPasswordChanged(String password,String cPassword){
    final error = KValidator.validatePassword(password, cPassword);
    setState(() {
      validPassword = error == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
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
                          image: AssetImage(
                              tLogo
                          ),
                          fit: BoxFit.cover,
                      )
                    ),
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              const SizedBox(
                height: 0,
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
                    CustomInputField(
                        controller: nameController,
                        hintText: "Brendon Macalum",
                        labelText: "Name",
                        isValid: validName,
                        onChanged: (name)=>onNameChanged(name),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon
                    ),
                    const SizedBox(height: 15,),
                    CustomInputField(
                        controller: emailController,
                        hintText: "brendonmacalum@gmail.com",
                        labelText: "Email",
                        isValid: validEmail,
                        onChanged: (email)=>onEmailChanged(email),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon
                    ),

                    const SizedBox(height: 15,),

                    CustomInputField(
                        controller: passwordController,
                        hintText: "Password must be 8 character",
                        labelText: "Password",
                        isValid: validPassword,
                        onChanged: (password)=>onPasswordChanged(password,confirmPasswordController.text),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon,
                        obscureText:true
                    ),

                    const SizedBox(height: 15,),

                    CustomInputField(
                        controller: confirmPasswordController,
                        hintText: "Re-enter password",
                        labelText: "Confirm Password",
                        isValid: validPassword,
                        onChanged: (cPassword)=>onPasswordChanged(passwordController.text,cPassword),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon,
                        obscureText:true
                    ),

                    const SizedBox(height: 15,),

                    PrimaryButton(
                      label: "Register",
                      isEnabled:  validName && validEmail && validPassword,
                      isLoading: false, // Set true if submitting
                      onPressed: () {
                        // Your submit logic
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PrimaryHeader(
                          text: 'Already have an account',
                          color: KColors.gray,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: (){
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
      )
    );
  }

}



