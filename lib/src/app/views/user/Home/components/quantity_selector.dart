import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Function(int) onChanged;

  const QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // _buildButton(
          //   icon: Icons.remove,
          //   onPressed: () {
          //     if (quantity > 1) {
          //       onChanged(quantity - 1);
          //     }
          //   },
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // _buildButton(
          //   icon: Icons.add,
          //   onPressed: () {
          //     onChanged(quantity + 1);
          //   },
          // ),
        ],
      ),
    );
  }
}
