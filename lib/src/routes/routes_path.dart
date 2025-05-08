import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/auth/register/owner_register.dart';
import 'package:bus_booking/src/app/views/auth/register/register.dart';
import 'package:bus_booking/src/app/views/user/Cart/cart_screen.dart';
import 'package:bus_booking/src/app/views/user/Home/home_screen.dart';
import 'package:bus_booking/src/app/views/user/Profile/profile_screen.dart';
import 'package:bus_booking/src/app/views/user/Search/search_screen.dart';
import 'package:bus_booking/src/app/views/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => const WelcomePage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/owner-register', page: () => const OwnerRegisterPage()),
    
    //user route
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(name: '/search', page: () => const SearchPage()),
    GetPage(name: '/cart', page: () => const CartPage()),
    GetPage(name: '/profile', page: () => const profilePage()),
  ];
}
