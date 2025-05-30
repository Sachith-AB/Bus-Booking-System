import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Home/components/banner_slider.dart';
import 'package:bus_booking/src/app/views/user/Home/components/category_list.dart';
import 'package:bus_booking/src/app/views/user/Home/components/product_grid.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Sample data
    final List<Category> categories = [
      Category(id: '1', name: 'Coffee',  icon: Icons.coffee_outlined),
      Category(id: '2', name: 'Croissant',  icon: Icons.coffee_outlined),
      Category(id: '3', name: 'Crepe',icon: Icons.coffee_outlined),
      Category(id: '4', name: 'Donut',icon: Icons.coffee_outlined),
      Category(id: '5', name: 'Bread',icon: Icons.coffee_outlined),
    ];
    //those items should be available

    final List<Product> popularProducts = [
      Product(
        id: '1',
        name: 'Americano',
        description: "A delicious Americano coffee",
        price: 3.99,
        imageUrl: coffee,
        isFavorite: false,
        category: 'Coffee',
        availableStatus: 'Available',
      ),
      Product(
        id: '2',
        name: 'Plain Croissant',
        description: "A delicious plain croissant",
        price: 2.99,
        imageUrl: bread,
        isFavorite: true,
        category: 'Croissant',
        availableStatus: 'Available',
      ),
      Product(
        id: '3',
        name: 'Plain Croissant',
        description: "A delicious plain croissant",
        price: 2.99,
        imageUrl: bread,
        isFavorite: true,
        category: 'Croissant',
        availableStatus: 'Available',
      ),
    ];

    final List<Map<String, dynamic>> banners = [
      {
        'imageUrl': burgerKing,
      },
      {
        'imageUrl': delicious,
      },
    ];


    return MainScaffold(
      selectedIndex: 1,
      body: Scaffold(
        appBar: CustomAppBar(
          title: 'Food Store',
          showBackButton: false,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade50
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //banner list
                BannerSlider(banners: banners),

                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: 
                  PrimaryHeader(
                    text: 'Categories',
                    weight: FontWeight.bold,
                    size: 18,
                  )
                ),
                const SizedBox(height: 12),

                //category list
                CategoryList(categories: categories),

                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: PrimaryHeader(
                    text: 'Most Popular',
                  ),
                ),
                const SizedBox(height: 12),
                ProductGrid(products: popularProducts),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      )
    );
  }
}
