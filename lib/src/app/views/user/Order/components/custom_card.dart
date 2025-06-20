import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final int currentStep;
  final bool isSelected;
  final dynamic details;
  final String? deliveryAddress;
  final VoidCallback? onChangeAddress; // This means: void Function()

  const CustomCard({
    super.key,
    required this.currentStep,
    required this.isSelected,
    required this.details,
    this.deliveryAddress,
    this.onChangeAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? KColors.appPrimary:KColors.black,
        ),
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? KColors.appPrimary.shade50:null,
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
                    Icon(
                      Icons.work,
                      color: isSelected ? KColors.appPrimary:KColors.black,
                    ),
                    const SizedBox(width: 8,),
                    PrimaryHeader(
                      text: currentStep == 1 ? 'Credit Card':'Work',
                      size: 16,
                      weight: FontWeight.w600,
                      color: isSelected ? KColors.appPrimary:KColors.black,
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      decoration: BoxDecoration(
                        color: isSelected ? KColors.appPrimary:KColors.black,
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
                if(isSelected)
                  const Icon(Icons.check_circle_outline_outlined,color: KColors.appPrimary,),
              ],
            ),
            PrimaryHeader(
              text: details![1],
              size: 16,
              weight: FontWeight.w500,
            ),
            PrimaryHeader(
              text: currentStep == 1 ? '5562 8589 9235 ****' : details![7],
              size: 16,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PrimaryHeader(
                    text: currentStep == 1
                        ? 'Secure checkout powered by'
                        : (deliveryAddress ?? details![6]), // Show override if exists
                    size: 16,
                    weight: FontWeight.w500,
                    color: KColors.gray,
                  ),
                ),
                if (currentStep != 1)
                  GestureDetector(
                    onTap: onChangeAddress,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: KColors.appPrimary.withOpacity(0.1), // soft background
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: KColors.appPrimary,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none, // no underline
                        ),
                      ),
                    ),

                  ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}