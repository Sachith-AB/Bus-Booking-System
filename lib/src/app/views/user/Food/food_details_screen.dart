import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
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
        //body: ,
    ),);
  }
}