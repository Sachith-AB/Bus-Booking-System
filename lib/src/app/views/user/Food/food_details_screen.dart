import 'dart:convert';
import 'dart:io';

import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/controllers/user/user_update_controller.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailsPage extends StatefulWidget {
  final Product product;

  const FoodDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  List<dynamic> favoriteList = [];

  @override
  void initState() {
    super.initState();
    _loadFavorite();
  }

  void _loadFavorite() {
    final user = SharedAuthUser.getAuthUser();
    if (user != null && user.length > 9) {
      setState(() {
        favoriteList = jsonDecode(user[9]);
      });
    }
  }

  void addToCart() {
    final user = SharedAuthUser.getAuthUser();
    final controller = Get.put(UserUpdateController());
    if (user != null && user.isNotEmpty) {
      final userId = user[0];
      controller.addToCart(userId, widget.product.id);
    }
  }

  void addToFavorite() async {
    final user = SharedAuthUser.getAuthUser();
    final controller = Get.put(UserUpdateController());
    if (user != null && user.isNotEmpty) {
      final userId = user[0];
      await controller.addToFavorite(userId, widget.product.id);
      // Reload favorite list from SharedPreferences after update
      await Future.delayed(const Duration(milliseconds: 300));
      _loadFavorite();
    }
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(widget.product.imageUrl),
                            height: 450,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                coffee,
                                height: 450,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                favoriteList.contains(widget.product.id)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favoriteList.contains(widget.product.id)
                                    ? Colors.red
                                    : Colors.white,
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                addToFavorite();
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                  ),
                                  onPressed: () {
                                    addToCart();
                                  },
                                  child: const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.50),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.more_horiz, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        PrimaryHeader(text: widget.product.name),
                        const SizedBox(width: 12),
                        PrimaryHeader(
                          text: "LKR ${widget.product.price.toString()}",
                          size: 20,
                          weight: FontWeight.w500,
                          color: KColors.appPrimary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    PrimaryHeader(
                      text: widget.product.description,
                      size: 15,
                      weight: FontWeight.normal,
                      color: KColors.gray,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // "Order Now" Button at bottom of screen
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: PrimaryButton(
                label: 'Order Now',
                onPressed: () {
                  // Order action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
