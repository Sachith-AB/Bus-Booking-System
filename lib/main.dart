import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: KColors.appPrimary,
        useMaterial3: true,
      ),
      initialRoute: '/register',  // Start with Login Page
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
      ],
    );
  }
}
