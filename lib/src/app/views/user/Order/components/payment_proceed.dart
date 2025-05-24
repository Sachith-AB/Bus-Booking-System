import 'package:bus_booking/src/app/views/user/Order/components/cash_on_delivery.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
class PaymentProceed extends StatefulWidget {
  final currentStep;
  const PaymentProceed({
    super.key,
    required this.currentStep,
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
        CustomCard(currentStep: widget.currentStep,),
        const SizedBox(height: 10,),
        const CashOnDelivery(),
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
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeader(
                    text: 'Food Store',
                    size: 20,
                  ),
                  PrimaryHeader(
                    text: 'Pick-up and save AED 5S',
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
        const PrimaryHeader(
          text: 'Do you have promi code?',
          size: 16,
          weight: FontWeight.w500,
        )
      ]
    );
  }
}