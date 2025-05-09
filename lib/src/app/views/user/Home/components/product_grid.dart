import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Food/food_details_screen.dart';
import 'package:bus_booking/src/app/views/user/Home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: (){
                Get.to(() => FoodDetailsPage(product: product));
              },
              child: ProductCard(product: product),
            );
          },
        ),
      );
  }
}
