import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

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
                Get.offNamed('/food-page',arguments: product);
              },
              child: ProductCard(product: product),
            );
          },
        ),
      );
  }
}
