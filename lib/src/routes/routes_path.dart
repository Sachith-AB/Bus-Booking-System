import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/auth/login/login.dart';
import 'package:bus_booking/src/app/views/auth/register/owner_register.dart';
import 'package:bus_booking/src/app/views/auth/register/register.dart';
import 'package:bus_booking/src/app/views/hotelowner/category/category_create.dart';
import 'package:bus_booking/src/app/views/hotelowner/food/food_create.dart';
import 'package:bus_booking/src/app/views/hotelowner/food/food_update.dart';
import 'package:bus_booking/src/app/views/hotelowner/orders/orders_screen.dart';
import 'package:bus_booking/src/app/views/user/Cart/cart_screen.dart';
import 'package:bus_booking/src/app/views/user/Food/food_details_screen.dart';
import 'package:bus_booking/src/app/views/user/Home/home_screen.dart';
import 'package:bus_booking/src/app/views/user/Order/checkout_order_screen.dart';
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
    GetPage(name: '/food-page', page: (){
      final product = Get.arguments as Product;
        return FoodDetailsPage(product: product);
    }),
    GetPage(name: '/checkout-order', page: () {
      final args = Get.arguments as Map<String, dynamic>;
      final product = args['product'] as Product;
      final quantity = args['quantity'] as int;
      return CheckoutOrderPage(product: product, quantity: quantity);
    }),

    //hotelOwner
    GetPage(name: '/create-food', page: () => const FoodCreatePage()),
    GetPage(name: '/update-food', page: () {
      final product = Get.arguments as Product;
      return FoodUpdatePage(product: product);
    }),
    GetPage(name: '/create-category', page: () => const CreateCategoryPage()),
    GetPage(name: '/orders', page: () => const OrdersPage()),

  ];
}
