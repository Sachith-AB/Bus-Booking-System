import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CashOnDelivery extends StatefulWidget {
  const CashOnDelivery({super.key});

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: KColors.black,),
        borderRadius:BorderRadius.circular(16)
      ),
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: KColors.black,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Padding(padding: EdgeInsets.all(8),
                    child: PrimaryHeader(
                      text: 'CASH',
                      color: KColors.white,
                      size: 16,
                    )
                  ),
                ),
                const SizedBox(width: 8,),
                const PrimaryHeader(
                  text: 'Cash on Delivery',
                  size: 20,
                )
              ],
            ),
            const SizedBox(height: 10,),
            const PrimaryHeader(
              text: 'Additional Add 20 chargers for COD services',
              size:16,
              weight: FontWeight.w600,
              color: KColors.gray,
            )
          ],
        ),
      ),
    );
  }
}