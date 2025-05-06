import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/cupertino.dart';

class PrimaryHeader extends StatelessWidget {

  final String text;
  final Color? color;
  final FontWeight? weight ;
  final double? size;


  const PrimaryHeader({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size


  });

  @override
  Widget build(BuildContext context) {

    final Color textColor = color ?? KColors.black;
    final FontWeight fontWeight = weight ?? FontWeight.bold;
    final double fontSize = size ?? 27;

    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor
      ),
    );
  }
}
