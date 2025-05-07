import 'package:bus_booking/src/app/components/custome_search_bar.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Home/components/banner_slider.dart';
import 'package:bus_booking/src/app/views/user/Home/components/category_list.dart';
import 'package:bus_booking/src/app/views/user/Home/components/product_grid.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<Category> categories = [
      Category(id: '1', name: 'Coffee', iconPath: tLogo),
      Category(id: '2', name: 'Croissant', iconPath: tLogo),
      Category(id: '3', name: 'Crepe', iconPath: 'assets/foods/crepe.avif'),
      Category(id: '4', name: 'Donut', iconPath: 'assets/foods/donut.avif'),
      Category(id: '5', name: 'Bread', iconPath: 'assets/foods/bread.avif'),
    ];

    final List<Product> popularProducts = [
      Product(
        id: '1',
        name: 'Americano',
        price: 3.99,
        imageUrl: tLogo,
        isFavorite: false,
        category: 'Coffee',
      ),
      Product(
        id: '2',
        name: 'Plain Croissant',
        price: 2.99,
        imageUrl: tLogo,
        isFavorite: true,
        category: 'Croissant',
      ),
    ];

    final List<Map<String, dynamic>> banners = [
      {
        'title': 'BLUEBERRY\nWAFFLES',
        'discount': '15% OFF',
        'buttonText': 'Order Now',
        'imageUrl': tLogo,
        'backgroundColor': const Color(0xFF1D4F6E),
        'textColor': Colors.white,
      },
      {
        'title': 'Start the day\nwith great\ntaste',
        'buttonText': 'Order Now',
        'imageUrl': tLogo,
        'backgroundColor': const Color(0xFFF5F5F5),
        'textColor': const Color(0xFF3A2618),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Store'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchBarWidget(),
              ),
              const SizedBox(height: 16),

              //banner list
              BannerSlider(banners: banners),
              
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D4F6E),
                  ),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
