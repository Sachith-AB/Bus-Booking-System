import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBack;
  final bool showAddfoodButton;
  final bool showCartButton;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor = Colors.white,
    this.showBackButton = true,
    this.onBack,
    this.showCartButton = false,
    this.showAddfoodButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: showBackButton,
      title: title != null
          ? PrimaryHeader(
              text: title!,
              weight: FontWeight.w500,
            )
          : null,
      leading: showBackButton
          ? IconButton(
              onPressed: onBack ?? () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
            )
          : null,
      actions: [
        if (showAddfoodButton == true)
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/create-food');
            },
          ),
        if (showCartButton)
          IconButton(
            icon: const Icon(Icons.local_shipping_outlined),
            onPressed: () {
              Get.toNamed('/order-history');
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
