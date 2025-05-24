import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final currentStep;
  const CustomCard({
    super.key,
    required this.currentStep
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: KColors.appPrimary),
        borderRadius: BorderRadius.circular(10),
        color: KColors.appPrimary.shade50
      ),
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.work,color: KColors.appPrimary,),
                    const SizedBox(width: 8,),
                    PrimaryHeader(
                      text: currentStep == 1 ? 'Credit Card':'Work',
                      size: 16,
                      weight: FontWeight.w600,
                      color: KColors.appPrimary,
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      decoration: BoxDecoration(
                        color: KColors.appPrimary,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Padding(padding: EdgeInsets.all(4),
                        child: PrimaryHeader(
                          text: 'Default',
                          color: KColors.white,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Icon(Icons.check_circle_outline_outlined,color: KColors.appPrimary,),
              ],
            ),
            const PrimaryHeader(
              text: 'Irumii',
              size: 16,
              weight: FontWeight.w500,
            ),
            PrimaryHeader(
              text: currentStep == 1 ? '5562 8589 9235 ****' : '0772843737',
              size: 16,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 20,),
            PrimaryHeader(
              text: currentStep == 1 ?'Secure checkout powered by':'address',
              size: 16,
              weight: FontWeight.w500,
              color: KColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}