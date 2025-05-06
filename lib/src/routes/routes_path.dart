import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/auth/register/owner_register.dart';
import 'package:bus_booking/src/app/views/auth/register/register.dart';
import 'package:bus_booking/src/app/views/hotelowner/food/food_create.dart';
import 'package:bus_booking/src/app/views/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/', page: () => const WelcomePage()),
    GetPage(name: '/owner-register', page: () => const OwnerRegisterPage()),
    GetPage(name: '/owner-addfood', page: ()=>const FoodCreatePage()),
  ];
}