import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backgroundColor = Colors.white,
    this.showBackButton = true,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: title != null ? Text(title!, style: const TextStyle(color: Colors.black)) : null,
      leading: showBackButton
          ? IconButton(
        onPressed: onBack ?? () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
