import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CashOnDelivery extends StatefulWidget {
  final bool isSelected;
  const CashOnDelivery({
    super.key,
    required this.isSelected
  });

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: widget.isSelected ? KColors.appPrimary:KColors.black,),
        borderRadius:BorderRadius.circular(8),
        color: widget.isSelected ? KColors.appPrimary.shade50 : null
      ),
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: widget.isSelected ? KColors.appPrimary:KColors.black,
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
                    PrimaryHeader(
                      text: 'Cash on Delivery',
                      size: 20,
                      color: widget.isSelected ? KColors.appPrimary:KColors.black,
                    )
                  ],
                ),
                if(widget.isSelected)
                  const Icon(Icons.check_circle_outline_outlined,color: KColors.appPrimary)
              ],
            ),
            const SizedBox(height: 10,),
            const PrimaryHeader(
              text: 'Additional Add 350 LKR chargers for COD services',
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