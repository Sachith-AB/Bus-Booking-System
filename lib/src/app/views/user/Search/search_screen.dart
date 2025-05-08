import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/custom_search_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Search/components/category_list.dart';
import 'package:bus_booking/src/app/views/user/Search/components/product_list.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample data
    final List<Category> categories = [
      Category(id: '1', name: 'Coffee', iconPath:coffee , icon: Icons.coffee_outlined),
      Category(id: '2', name: 'Croissant', iconPath: croissant , icon: Icons.bakery_dining),
      Category(id: '3', name: 'Crepe', iconPath: crepe , icon: Icons.set_meal),
      Category(id: '4', name: 'Donut', iconPath: donut ,  icon : Icons.donut_large),
      Category(id: '5', name: 'Bread', iconPath: bread , icon: Icons.bakery_dining),
      Category(id: '6', name: 'Donut', iconPath: donut , icon: Icons.donut_large),
      Category(id: '7', name: 'Bread', iconPath: bread , icon: Icons.bakery_dining),
    ];

    final List<Product> products = [
      Product(
        id: '1',
        name: 'Americano',
        description: "A delicious Americano coffee",
        price: 3.99,
        imageUrl: coffee,
        isFavorite: false,
        category: 'Coffee',
      ),
      Product(
        id: '2',
        name: 'Plain Croissant',
        description: "A delicious plain croissant",
        price: 2.99,
        imageUrl: bread,
        isFavorite: true,
        category: 'Croissant',
      ),
      Product(
        id: '3',
        name: 'Plain Croissant',
        description: "A delicious plain croissant",
        price: 2.99,
        imageUrl: bread,
        isFavorite: true,
        category: 'Croissant',
      ),
    ];

  return MainScaffold(
      selectedIndex: 1,
      body: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade100,
          title: 'Search',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(child: SearchBarWidget()),
                          const SizedBox(width: 8),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: KColors.appPrimary.shade100, // adjust as needed
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.filter_list, size: 30),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      CategoryList(categories: categories),
                      const SizedBox(height: 12),
                      ProductList(products:products)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}