import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/controllers/user_register_controller.dart';
import 'package:bus_booking/src/utils/validate/KValidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/constant.dart';
import '../../../components/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validEmail = false;
  bool validPassword = false;

  void onEmailChanged(String email) {
    setState(() {
      validEmail = KValidator.validateEmail(email);
    });
  }

  void onPasswordChanged(String password){
    final error = KValidator.validateLoginPassword(password);
    setState(() {
      validPassword = error == null;
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
          child:Column(
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
              const PrimaryHeader(
                text: "Welcome Back!",
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    DynamicForm(
                        fields:[
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
                            onChanged: (password) =>
                                onPasswordChanged(password),
                            prefixIcon: AppInputStyle.emailIcon,
                            obscureText: true,
                          ),
                        ],
                      ),
                    PrimaryButton(
                      label: 'Register',
                      isEnabled: validEmail && validPassword,
                      isLoading: false,
                      onPressed: (){
                        loginUser();
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PrimaryHeader(
                          text: 'Not register yet',
                          color: KColors.gray,
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const PrimaryHeader(
                            text: "Register",
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
          )
        ),
      ),
    );
  }

  final controller = Get.put(UserRegisterController());

  void loginUser () {
    final email = emailController.text.trim().toString();
    final password = passwordController.text.trim().toString();

    controller.loginAllUser(email, password);
  }
}
