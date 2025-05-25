import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../utils/color/colors.dart';

class OrderPlaceSuccess extends StatefulWidget {
  final int currentStep;

  const OrderPlaceSuccess({
    super.key,
    required this.currentStep,
  });

  @override
  State<OrderPlaceSuccess> createState() => _OrderPlaceSuccessState();
}

class _OrderPlaceSuccessState extends State<OrderPlaceSuccess> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(delivery),
        ),
        const SizedBox(height: 40),
        const PrimaryHeader(
          text: 'Order placed Successfully!',
          size: 20,
          weight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.black,
              ),
              children: [
                TextSpan(
                  text: 'Congratulations! Your order has been placed.You can track your order number ',
                ),
                TextSpan(
                  text: '#6473458',
                  style: TextStyle(
                    color: KColors.appPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
                child: PrimaryButton(
                    label: 'Shopping',
                    backgroundColor: KColors.gray,
                    onPressed: (){})
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: PrimaryButton(label: 'Track Order', onPressed: (){})),
          ],
        )
      ],
    );
  }
}