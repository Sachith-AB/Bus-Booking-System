import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  final Product product;

  const FoodDetailsPage({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Scaffold(
        appBar: CustomAppBar(
          showBackButton: true,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade100,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 80), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        product.imageUrl,
                        height: 450,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    PrimaryHeader(text: product.name),
                    const SizedBox(height: 5),
                    PrimaryHeader(
                      text: product.description,
                      size: 15,
                      weight: FontWeight.normal,
                      color: KColors.gray,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: PrimaryButton(
                label: 'Order Now',
                onPressed: () {
                  // Your order button action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}