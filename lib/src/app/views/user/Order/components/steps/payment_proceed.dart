import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/views/user/Order/components/cash_on_delivery.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/app/views/user/Order/components/pickup_store.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';

class PaymentProceed extends StatefulWidget {
  final int currentStep;
  final VoidCallback onNext;
  final bool cod;
  final bool creditCard;
  final bool pickUp;
  final dynamic user;
  final  Function(dynamic method) onMethodSelect;

  const PaymentProceed({
    super.key,
    required this.currentStep,
    required this.onNext,
    this.cod = false,
    this.creditCard = true,
    this.pickUp = false,
    required this.user,
    required this.onMethodSelect
  });

  @override
  State<PaymentProceed> createState() => _PaymentProceedState();
}

class _PaymentProceedState extends State<PaymentProceed> {


  late bool cod = false;
  late bool creditCard = false;
  late bool pickUp = false;

  bool _showError = false;
  String method = '';

  @override
  void initState(){
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
      _showError = false;
      method = 'credit card';
    });
  }

  void selectCod() {
    setState(() {
      creditCard = false;
      cod = true;
      pickUp = false;
      _showError = false;
      method = 'cash on delivery';
    });
  }

  void selectPickup() {
    setState(() {
      creditCard = false;
      cod = false;
      pickUp = true;
      _showError = false;
      method = 'pickup from shop';
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
            details: widget.user,
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
        if (_showError )
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a payment method to place order',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        const SizedBox(height: 10,),
        // const PrimaryHeader(
        //   text: 'Do you have promo code?',
        //   size: 16,
        //   weight: FontWeight.w500,
        // )
        PrimaryButton(
            label: 'Place Order',
            onPressed:(){
              if(cod || creditCard || pickUp ){
                widget.onNext();
                widget.onMethodSelect(method);
              }else{
                setState(() {
                  _showError = true;
                });
              }
          }
        ),
      ]
    );
  }
}