import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/app/views/user/Search/components/product_card.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String userType = '';

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }
  Future<void> _loadUserType() async {
    await SharedAuthUser.init();
    final userData = SharedAuthUser.getAuthUser();
    if (userData != null && mounted) {
      setState(() {
        userType = userData[3]; // Index 3 = user_type
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // prevent inner scroll
      itemBuilder: (context, index) {
        final product = widget.products[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: KColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  final route = userType == 'hotelowner' ? '/update-food' : '/food-page';
                  Get.toNamed(route, arguments: product);
                },
                child: ProductCard(product: product)
              )
            ],
          ),
        );
      },
    );
  }
}
