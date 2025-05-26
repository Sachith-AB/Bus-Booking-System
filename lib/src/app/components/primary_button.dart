import 'package:flutter/material.dart';

import '../../utils/color/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool outline;
  final Color? outlineColor;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.height = 50,
    this.borderRadius = 12,
    this.backgroundColor,
    this.textColor,
    this.outline = false,
    this.outlineColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = backgroundColor ?? KColors.primaryColor;
    final Color fg = textColor ?? KColors.white;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? bg : Colors.grey.shade400,
          disabledBackgroundColor: Colors.grey.shade400,
          foregroundColor: fg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: outline
                ? BorderSide(color: outlineColor ?? KColors.primaryColor, width: 2)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(
          label,
          textAlign: TextAlign.center,  // This ensures text stays centered
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: fg,
          ),
        ),
      ),
    );
  }
}