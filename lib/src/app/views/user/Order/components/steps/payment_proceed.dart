import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/views/user/Order/components/cash_on_delivery.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/app/views/user/Order/components/pickup_store.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';

class PaymentProceed extends StatefulWidget {
  final int currentStep;
  final bool cod;
  final bool creditCard;
  final bool pickUp;

  const PaymentProceed({
    super.key,
    required this.currentStep,
    this.cod = false,
    this.creditCard = true,
    this.pickUp = false,
  });

  @override
  State<PaymentProceed> createState() => _PaymentProceedState();
}

class _PaymentProceedState extends State<PaymentProceed> {

  late bool cod;
  late bool creditCard;
  late bool pickUp;

  @override
  void intitState(){
    super.initState();
    cod = widget.cod;
    creditCard = widget.creditCard;
    pickUp = widget.pickUp;
  }

  void selectCreditCard() {
    setState(() {
      creditCard = true;
      cod = false;
      pickUp = false;
    });
  }

  void selectCod() {
    setState(() {
      creditCard = false;
      cod = true;
      pickUp = false;
    });
  }

  void selectPickup() {
    setState(() {
      creditCard = false;
      cod = false;
      pickUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const PrimaryHeader(
          text: 'Select a payment method',
          size: 18,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: selectCreditCard,
          child: CustomCard(
            currentStep: widget.currentStep,
            isSelected: creditCard,
          ),
        ),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: selectCod,
          child: CashOnDelivery(isSelected: cod,),
        ),
        const SizedBox(height: 20,),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              color:KColors.appPrimary
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeader(
                    text: 'Switch to Self-Pick up?',
                    size: 20,
                  ),
                  PrimaryHeader(
                    text: 'Save the extra delivery fee if you can pick-up your order(s).',
                    size:16,
                    weight: FontWeight.w600,
                    color: KColors.gray,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: selectPickup,
          child: PickupStore(isSelected: pickUp,),
        ),
        const SizedBox(height: 10,),
        // const PrimaryHeader(
        //   text: 'Do you have promo code?',
        //   size: 16,
        //   weight: FontWeight.w500,
        // )
        PrimaryButton(
            label: 'Place Order',
            onPressed: (){

            }
        ),
      ]
    );
  }
}