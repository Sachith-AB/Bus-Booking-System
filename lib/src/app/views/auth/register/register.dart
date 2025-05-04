import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../common/style/app_input_style.dart';
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
  bool validEmail = false;

  void onEmailChanged(String email) {
    setState(() {
      validEmail = validateEmail(email);
    });
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
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
        },
            icon: const Icon(Icons.arrow_back_ios_new_rounded
            )
        )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(
                // children: [
                //   // Container(
                //   //   decoration: BoxDecoration(
                //   //     borderRadius: BorderRadius.circular(10),
                //   //     image: const DecorationImage(
                //   //         image: AssetImage('assets/logo/logo.png'),
                //   //         fit: BoxFit.cover,
                //   //     )
                //   //   ),
                //   //   width: 10,
                //   //   height: 10,
                //   // )
                // ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                child:Padding(
                    padding:EdgeInsets.only(left: 16),
                  child: Text(
                    "Create a Account",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
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
                        hintText: "Brendon Maculum",
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
                        controller: emailController,
                        hintText: "*******",
                        labelText: "Password",
                        isValid: validEmail,
                        onChanged: (email)=>onEmailChanged(email),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon
                    ),

                    const SizedBox(height: 15,),

                    CustomInputField(
                        controller: emailController,
                        hintText: "******",
                        labelText: "Confirm Password",
                        isValid: validEmail,
                        onChanged: (email)=>onEmailChanged(email),
                        keyboardType: TextInputType.text,
                        prefixIcon: AppInputStyle.emailIcon
                    ),

                    const SizedBox(height: 15,),

                    PrimaryButton(
                      label: "Register",
                      isEnabled: validName && validEmail, // Example condition
                      isLoading: false, // Set true if submitting
                      onPressed: () {
                        // Your submit logic
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  final nameRegex = RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)*$');

  bool validName = false;
  String _nameError = '';

  onNameChanged(String userName){
    final name = userName.trim().toString();

    setState(() {
      _nameError = '';
      validName = false;
      if(name.isEmpty){
        _nameError = "* Name is required.";
      }else if(!nameRegex.hasMatch(name) || name.length < 3){
        _nameError = "* Name is invalid";
      }else {
        validName = true;
      }
    });
  }

}



