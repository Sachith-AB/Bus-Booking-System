import 'dart:convert';

import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/controllers/user/cart_controller.dart';
import 'package:bus_booking/src/app/controllers/user/shared_auth_user.dart';
import 'package:bus_booking/src/app/views/user/Cart/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final user = SharedAuthUser.getAuthUser();
  
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

  final Map<int, int> quantities = {};
  final Map<int, bool> selectedItems = {};
  final double deliveryFee = 350.0;

  final controller = Get.put(CartController());
  var cartItems = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < cartItems.length; i++) {
      quantities[i] = 1;
      selectedItems[i] = false;
    }
    _loadCartItems();
  }


Future<void> _loadCartItems() async {
  try {
    // Step 1: Get user[8] as a String
    final rawFoodIds = user?[8];

    // Step 2: Decode JSON string to List
    List<dynamic> decoded = jsonDecode(rawFoodIds!);

    // Step 3: Filter out empty or invalid entries and cast to List<String>
    List<String> foodIds = decoded
        .where((id) => id != null && id.toString().isNotEmpty)
        .map((id) => id.toString())
        .toList();

    // Step 4: Call the controller function
    final result = await controller.getCartProduct(foodIds);

    // Step 5: Update state
    setState(() {
      cartItems = result;
      for (int i = 0; i < cartItems.length; i++) {
        quantities[i] = 1;
        selectedItems[i] = false;
      }
    });
  } catch (e) {
    print('Failed to load cart items: $e');
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
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      'LKR ${_calculateTotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
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
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      'LKR ${deliveryFee.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
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
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 139, 138, 138)),
                    ),
                    Text(
                      'LKR ${_calculateGrandTotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
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
