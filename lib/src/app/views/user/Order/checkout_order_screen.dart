import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/views/user/Order/components/delivery_address.dart';
import 'package:bus_booking/src/app/views/user/Order/components/step_indicator.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CheckoutOrderPage extends StatefulWidget {
  const CheckoutOrderPage({super.key});

  @override
  State<CheckoutOrderPage> createState() => _CheckoutOrderScreenState();
}

class _CheckoutOrderScreenState extends State<CheckoutOrderPage> {
  int currentStep = 0;
  String selectedAddress = 'work';
  String selectedPaymentMethod = 'credit card';
  bool cashOnDelivery = false;
  bool selfPickup = false;

  final List<String> stepTitles = [
    'Delivery Address',
    'Payment',
    'Order Placed'
  ];


  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: KColors.appPrimary.shade50
        ),
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      PrimaryHeader(
                        text: 'Checkout (${currentStep + 1}/3)',
                        weight: FontWeight.w500,
                        size: 18,
                      ),
                      StepIndicator(currentStep: currentStep,),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _buildStepContent(),
              ],
            )
          ),
        )
      )
    );
  }

  Widget _buildStepContent() {
    switch (currentStep) {
      case 0:
        return DeliveryAddress();
      case 1:
        //return _buildPaymentContent();
      case 2:
        //return _buildOrderPlacedContent();
      default:
        return Container();
    }
  }
}

