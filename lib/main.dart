import 'package:bus_booking/src/app/views/auth/register/owner_register.dart';
import 'package:bus_booking/src/app/views/welcome_screen.dart';
import 'package:bus_booking/src/routes/routes_path.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/auth/register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 🔥 Initialize Firebase
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
      initialRoute: '/profile',  // Start with Login Page
      getPages: AppRoutes.routes
    );
  }
}
