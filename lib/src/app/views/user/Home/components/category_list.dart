import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length + 1, // +1 for "Show all" button
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildCategoryItem(
                  context,
                  Category(
                    id: 'all',
                    name: 'Show all',
                    iconPath: 'assets/icons/all.png',
                  ),
                  isShowAll: true,
                );
              }
              return _buildCategoryItem(context, categories[index - 1]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, Category category, {bool isShowAll = false}) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isShowAll
                  ? const Icon(Icons.apps, color: Color(0xFF1D4F6E), size: 30)
                  : Image.asset(
                category.iconPath,
                width: 30,
                height: 30,
                color: const Color(0xFF1D4F6E),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
