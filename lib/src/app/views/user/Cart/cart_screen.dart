import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 2,
      body: Scaffold(

      )
    );;
  }
}