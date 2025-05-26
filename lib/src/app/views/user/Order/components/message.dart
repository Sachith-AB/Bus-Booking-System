import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.appPrimary.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child:const Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Row(
          children: [
            Icon(Icons.info, color: KColors.black, size: 20),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'You are selecting a different city so before which was Dubai. Delivery charges may vary for this city.',
                style: TextStyle(
                  color: KColors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}