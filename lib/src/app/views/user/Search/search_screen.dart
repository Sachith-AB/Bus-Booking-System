import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_search_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/controllers/foods/food_controller.dart';
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/controllers/user_controller.dart';
import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/app/views/user/Search/components/category_list.dart';
import 'package:bus_booking/src/app/views/user/Search/components/filter_bottom_sheet.dart';
import 'package:bus_booking/src/app/views/user/Search/components/product_list.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final foodController = Get.put(FoodController());
  final userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    foodController.getAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Category> categories = [
      Category(id: '1', name: 'Coffee', icon: Icons.coffee_outlined),
      Category(id: '2', name: 'Croissant', icon: Icons.bakery_dining),
      Category(id: '3', name: 'Crepe', icon: Icons.set_meal),
      Category(id: '4', name: 'Donut', icon: Icons.donut_large),
      Category(id: '5', name: 'Bread', icon: Icons.bakery_dining),
      Category(id: '6', name: 'Donut', icon: Icons.donut_large),
      Category(id: '7', name: 'Bread', icon: Icons.bakery_dining),
    ];

    return Obx(() {
      final userType = userController.userType.value;
      final showCartButton = userType != 'hotelowner';

      return MainScaffold(
        selectedIndex: 2,
        body: Scaffold(
          appBar: CustomAppBar(
            showBackButton: false,
            showCartButton: showCartButton,
            showAddfoodButton: !showCartButton,
            backgroundColor: KColors.appPrimary.shade100,
            title: showCartButton ? 'Search' : 'Foods',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: SearchBarWidget()),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  isScrollControlled: true,
                                  builder: (context) => const FilterBottomSheet(),
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: KColors.appPrimary.shade100,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(Icons.filter_list, size: 30),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        CategoryList(categories: categories),
                        const SizedBox(height: 12),
                        Obx(() {
                          final products = foodController.foods;
                          if (products.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text('No products found.'),
                              ),
                            );
                          }

                          return ProductList(products: products);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
