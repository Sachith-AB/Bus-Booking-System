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
    return  Padding(padding:const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      child: Column(
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
                  Expanded(child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: i < widget.currentStep ? KColors.appPrimary : KColors.gray,
                      borderRadius:  BorderRadius.circular(1)
                    ),
                  )
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}