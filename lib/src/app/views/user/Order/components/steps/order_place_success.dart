import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../utils/color/colors.dart';

class OrderPlaceSuccess extends StatefulWidget {
  final int currentStep;
  final String uniqueId;

  const OrderPlaceSuccess({
    super.key,
    required this.currentStep,
    required this.uniqueId,
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
            text:  TextSpan(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.black,
              ),
              children: [
                const TextSpan(
                  text: 'Congratulations! Your order has been placed.You can track your order number ',
                ),
                TextSpan(
                  text: widget.uniqueId,
                  style: const TextStyle(
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
                    onPressed: (){
                      Get.offNamed('/search');
                    })
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