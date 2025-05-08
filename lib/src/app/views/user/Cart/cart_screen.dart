import 'package:bus_booking/src/app/views/user/Cart/components/item_card.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';

import 'package:bus_booking/src/app/models/product_model.dart';
import 'package:bus_booking/src/utils/color/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // to calculate the total price of items in the cart
  double _calculateTotal() {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i].price * (quantities[i] ?? 1);
    }
    return total;
  }

  // Example cart items
  final List<Product> cartItems = [
    Product(
      id: '1 ',
      name: 'lain Croissant',
      category: 'Sandwich',
      price: 500,
      imageUrl: bread,
      description: 'Kanapka z pieczywem żytnim...',
      isFavorite: false
    ),
    Product(
      id: '2',
      name: 'lain Croissant',
      category: 'Sandwich',
      price: 500,
      imageUrl: bread,
      description: 'Kanapka z pieczywem żytnim...',
      isFavorite: false
    ),
    Product(
      id: '3',
      name: 'lain Croissant',
      category: 'Sandwich',
      price: 500,
      imageUrl: bread,
      description: 'Kanapka z pieczywem żytnim...',
      isFavorite: false
    ),
    Product(
      id: '4',
      name: 'lain Croissant',
      category: 'Sandwich',
      price: 500,
      imageUrl: bread,
      description: 'Kanapka z pieczywem żytnim...',
      isFavorite: false
    ),
    Product(
      id: '5',
      name: 'lain Croissant',
      category: 'Sandwich',
      price: 500,
      imageUrl: bread,
      description: 'Kanapka z pieczywem żytnim...',
      isFavorite: false
    ),
  ];

  final Map<int, int> quantities = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < cartItems.length; i++) {
      quantities[i] = 1;
    }
  }

  void _increaseQty(int index) {
    setState(() {
      quantities[index] = (quantities[index] ?? 1) + 1;
    });
  }

  void _decreaseQty(int index) {
    setState(() {
      if ((quantities[index] ?? 1) > 0) {
        quantities[index] = (quantities[index] ?? 1) - 1;
      }
    });
  }
@override
Widget build(BuildContext context) {
  return MainScaffold(
    selectedIndex: 2,
    body: Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        showBackButton: false,
        showCartButton: true,
        backgroundColor: KColors.appPrimary.shade100,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                final qty = quantities[index] ?? 1;

                return CartItemCard(
                  product: product,
                  quantity: qty,
                  onAdd: () => _increaseQty(index),
                  onRemove: () => _decreaseQty(index),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price of the cart:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${_calculateTotal().toStringAsFixed(2)} LKR',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    
    ),
  );
}

}
