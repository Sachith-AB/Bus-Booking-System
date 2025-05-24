import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatefulWidget {
  final int currentStep;
  
  const StepIndicator({
    super.key,
    required this.currentStep
  });

  @override
  State<StepIndicator> createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for(int i=0;i<3;i++)...[
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i < widget.currentStep ? KColors.appPrimary : KColors.white,
                        border: Border.all(color: i <= widget.currentStep ? 
                          KColors.appPrimary: 
                          KColors.gray
                        ),
                      ),
                      child: Center(
                        child: i < widget.currentStep ?
                          const Icon(
                            Icons.check,
                            color: KColors.white,
                            size: 30,
                          ):
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == widget.currentStep ? KColors.appPrimary : KColors.gray,
                            ),
                          ) 
                      ),
                    ),
                    if(i<2)
                      Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            for (int j = 0; j < 12; j++) ...[
                              Expanded(
                                child: Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: i < widget.currentStep ? KColors.appPrimary : KColors.gray,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                              if (j < 11) const SizedBox(width: 2),
                            ],
                          ],
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery address',
              style: TextStyle(
                fontSize: 12,
                color: widget.currentStep >= 0 ? KColors.appPrimary : KColors.gray,
              ),
            ),
            Text(
              'Payment',
              style: TextStyle(
                fontSize: 12,
                color: widget.currentStep >= 1 ? KColors.appPrimary : KColors.gray,
              ),
            ),
            Text(
              'Order Placed',
              style: TextStyle(
                fontSize: 12,
                color: widget.currentStep >= 2 ? KColors.appPrimary : KColors.gray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}