import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color/colors.dart';

class PickupStore extends StatelessWidget {
  final bool isSelected;
  const PickupStore({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? KColors.appPrimary.shade50:null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? KColors.appPrimary:KColors.black,),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Address Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryHeader(
                text: 'Food Store',
                size: 20,
                color: isSelected ? KColors.appPrimary:KColors.black,
              ),
              const SizedBox(height: 4),
              const PrimaryHeader(
                text: 'Pick-up and save AED 5S',
                size: 16,
                weight: FontWeight.w600,
                color: KColors.gray,
              ),
            ],
          ),

          if(isSelected)
          // Right side: Pickup Toggle Button
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline_outlined,color: KColors.appPrimary,),
                SizedBox(height: 4),
                Text(
                  'pickup selected',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: KColors.gray,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
