import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/app/components/primary_header.dart';
import 'package:bus_booking/src/app/views/user/Order/components/custom_card.dart';
import 'package:bus_booking/src/app/views/user/Order/components/message.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  final int currentStep;
  final VoidCallback onNext;
  final bool isSelect;
  final dynamic user;
  final Function(dynamic address)  onAddressSelected;

  const DeliveryAddress({
    super.key,
    required this.currentStep,
    required this.onNext,
    required this.user,
    required this.onAddressSelected,
    this.isSelect = false,
  });

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  bool _showError = false;
  late bool isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelect;
  }

  void selectAddress() {
    setState(() {
      isSelect = !isSelect;
      _showError = false; // Clear error once a valid selection is made
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
        const SizedBox(height: 10),
        GestureDetector(
          onTap: selectAddress,
          child: CustomCard(
            currentStep: widget.currentStep,
            details: widget.user,
            isSelected: isSelect,
          ),
        ),
        const SizedBox(height: 10),
        if (_showError && !isSelect)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a delivery address before proceeding.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        const SizedBox(height: 10),
        const Message(),
        const SizedBox(height: 40),
        PrimaryButton(
          label: 'Proceed to Payment',
          onPressed: () {
            if (isSelect) {
              widget.onNext();
              widget.onAddressSelected(widget.user![6]);
            } else {
              setState(() {
                _showError = true;
              });
            }
          },
        ),
      ],
    );
  }
}
