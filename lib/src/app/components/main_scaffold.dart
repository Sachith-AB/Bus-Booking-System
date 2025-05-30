import 'package:bus_booking/src/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:get/get.dart';


class MainScaffold extends StatefulWidget {
  
  final Widget body;
  final int selectedIndex;
  const MainScaffold({
    super.key,
    required this.body,
    this.selectedIndex = 0,
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final userController = Get.find<UserController>();
  late int _currentIndex;
  

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    
  }

  void _onTabTapped(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });

    final userType = userController.userType.value;

    switch (index) {
      case 1:
        Get.toNamed('/home');
        break;
      case 2:
        Get.toNamed('/search');
        break;
      case 3:
        Get.toNamed(userType == 'hotelowner' ? '/orders' : '/cart');
        break;
      case 4:
        Get.toNamed('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!userController.isLoaded.value) {
        // Show loader until userType is loaded
        return const Center(child: CircularProgressIndicator());
      }

      final userType = userController.userType.value;

      return Scaffold(
        body: widget.body,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: KColors.appPrimary.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(1, Icons.home_outlined, 'Home'),
              _buildNavItem(
                2,
                userType == 'hotelowner'
                    ? Icons.food_bank_outlined
                    : Icons.search_outlined,
                userType == 'hotelowner' ? 'Foods' : 'Search',
              ),
              _buildNavItem(
                3,
                userType == 'hotelowner'
                    ? Icons.receipt_long_outlined
                    : Icons.shopping_cart_outlined,
                userType == 'hotelowner' ? 'Orders' : 'Cart',
              ),
              _buildNavItem(4, Icons.person_outline, 'Profile'),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(1000),
            bottomRight: Radius.circular(1000),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? KColors.black : KColors.gray),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? KColors.black : KColors.gray,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
