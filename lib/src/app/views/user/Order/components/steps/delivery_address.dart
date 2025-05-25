import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/app/views/user/Order/components/message.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  final int currentStep;
  final VoidCallback onNext;
  final bool isSelect;

  const DeliveryAddress({
    super.key,
    required this.currentStep,
    required this.onNext,
    this.isSelect = true,
  });

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {

  late bool isSelect = true;
  late int currentStep = 0;

  @override
  void initState(){
    super.initState();
    isSelect = widget.isSelect;
    currentStep = widget.currentStep;
  }

  //need to change after add another address
  void selectAddress(){
    setState(() {
      isSelect = !isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrimaryHeader(
          text: 'Select delivery address',
          size: 18,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 10,),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: KColors.black,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: KColors.black
                    ),
                  ),
                  child: const Icon(Icons.add,size: 16),
                ),
                const SizedBox(width: 12),
                const PrimaryHeader(
                  text: 'Add New Address',
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: selectAddress,
          child:CustomCard(
            currentStep: widget.currentStep,
            isSelected: isSelect,
          ),
        ),
        const SizedBox(height: 10),
        const Message(),
        const SizedBox(height: 40),
        PrimaryButton(
          label: 'Proceed to Payment', 
          onPressed: widget.onNext,
        ),
      ],
    );
  }
}