import 'package:bus_booking/src/app/models/category_model.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';

class CategoryList extends StatefulWidget {
  final List<Category> categories;
  // final Function(String) onCategorySelected;
  const CategoryList({
    super.key,
    required this.categories,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  bool _showAddButton = false;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }
  Future<void> _loadUserType() async {
    await SharedAuthUser.init(); // Ensure _prefs is initialized
    // Get the user data from SharedAuthUser
    final userData = SharedAuthUser.getAuthUser();
    if (userData != null && mounted) {
      setState(() {
        _showAddButton = userData[3] == 'hotelowner'; // index 3 = user_type
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // Compact height like your sample image
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length + (_showAddButton ? 1 : 0),
        itemBuilder: (context, index) {
          // If it's the last index and showAddButton is true, render the "+" button
          if (_showAddButton && index == widget.categories.length) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/create-category');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[300],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add, size: 18, color: Colors.black),
                    SizedBox(width: 6),
                    Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          final category = widget.categories[index];

          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: KColors.appPrimary.shade100,
            ),
            child: Row(
              children: [
                Icon(category.icon, size: 18, color: Colors.black), // or white if background is dark
                const SizedBox(width: 6),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
