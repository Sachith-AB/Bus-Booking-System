import 'package:bus_booking/src/app/components/primary_button.dart';
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
      if (selectedItems[i] == true) {
        total += cartItems[i].price * (quantities[i] ?? 1);
      }
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
  final Map<int, bool> selectedItems = {};
  final double deliveryFee = 350.0;

  


  @override
  void initState() {
    super.initState();
    for (int i = 0; i < cartItems.length; i++) {
      quantities[i] = 1;
      selectedItems[i] = false;
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
  double _calculateGrandTotal() {
    return _calculateTotal() + deliveryFee;
  }

@override
Widget build(BuildContext context) {
  return MainScaffold(
    selectedIndex: 3,
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

                return Row(
                  children: [
                    Checkbox(
                      value: selectedItems[index] ?? false,
                      activeColor: KColors.appPrimary,
                      onChanged: (value) {
                        setState(() {
                          selectedItems[index] = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: CartItemCard(
                        product: product,
                        quantity: qty,
                        onAdd: () => _increaseQty(index),
                        onRemove: () => _decreaseQty(index),
                      ),
                    ),
                  ],
                );

              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal:',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '${_calculateTotal().toStringAsFixed(2)} LKR',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Delivery:',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '${deliveryFee.toStringAsFixed(2)} LKR',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 139, 138, 138)),
                    ),
                    Text(
                      '${_calculateGrandTotal().toStringAsFixed(2)} LKR',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  label: 'Checkout',
                  
                  onPressed: () {
                    // Handle checkout for selected items
                  },
                  
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
