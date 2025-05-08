import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {

  final List<Category> categories;

  const CategoryList({
    super.key,
    required this.categories
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: KColors.appPrimary.shade100,
            ),
            child: Row(
              children: [
                Image.asset(
                  category.iconPath,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}