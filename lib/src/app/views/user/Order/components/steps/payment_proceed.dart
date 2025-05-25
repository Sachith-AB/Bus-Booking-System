import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/views/user/Order/components/cash_on_delivery.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';

class PaymentProceed extends StatefulWidget {
  final currentStep;
  final bool cod;
  const PaymentProceed({
    super.key,
    required this.currentStep,
    this.cod = true,
  });

  @override
  State<PaymentProceed> createState() => _PaymentProceedState();
}

class _PaymentProceedState extends State<PaymentProceed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const PrimaryHeader(
          text: 'Select a payment method',
          size: 18,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 10,),
        CustomCard(currentStep: widget.currentStep,),
        const SizedBox(height: 10,),
        CashOnDelivery(isSelected: widget.cod,),
        const SizedBox(height: 20,),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              color:KColors.appPrimary
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeader(
                    text: 'Switch to Self-Pick up?',
                    size: 20,
                  ),
                  PrimaryHeader(
                    text: 'Save the extra delivery fee if you can pick-up your order(s).',
                    size:16,
                    weight: FontWeight.w600,
                    color: KColors.gray,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KColors.black),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Address Info
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeader(
                    text: 'Food Store',
                    size: 20,
                  ),
                  SizedBox(height: 4),
                  PrimaryHeader(
                    text: 'Pick-up and save AED 5S',
                    size: 16,
                    weight: FontWeight.w600,
                    color: KColors.gray,
                  ),
                ],
              ),

              // Right side: Pickup Toggle Button
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 24,
                    decoration: BoxDecoration(
                      color: KColors.appPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'pickup\nselected',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        // const PrimaryHeader(
        //   text: 'Do you have promo code?',
        //   size: 16,
        //   weight: FontWeight.w500,
        // )
        PrimaryButton(
            label: 'Place Order',
            onPressed: (){
            }
        ),
      ]
    );
  }
}