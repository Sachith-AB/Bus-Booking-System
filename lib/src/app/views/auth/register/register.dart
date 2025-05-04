import 'package:flutter/material.dart';

import '../../../../common/style/app_input_style.dart';
import '../../../components/custom_input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
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
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomInputField(
          controller: emailController,
          hintText: "brandonloise@gmail.com",
          keyboardType: TextInputType.text,
          labelText: "Email",
          isValid: validEmail,
          onChanged: onEmailChanged,
          prefixIcon: AppInputStyle.emailIcon,
        ),
      ),
    );
  }
}
