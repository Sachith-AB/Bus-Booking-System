import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class AppInputStyle {

  //obscure character
  static String obscuringCharacter = '●';
  static String hintObscureCharacter = '●●●●●●●●●';

  //user input success with field filled color
  static Color validFillColor = KColors.primaryColor;

  //border
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: KColors.primaryColor));

  static OutlineInputBorder outlineDropDownInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black12));

  static OutlineInputBorder OutlineErorrBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red));

  // text style
  static TextStyle hintTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
  );
  static TextStyle labelTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle floatingLabelStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: Colors.red,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  // Icons
  // static Icon profileIcon = const Icon(
  //   Iconsax.user,
  //   color: KColors.primaryColor,
  //   size: 18,
  // );

  static Icon personIcon = const Icon(
    Icons.person_outline,
    color: KColors.primaryColor,
    size: 18,
  );
  static Icon emailIcon = const Icon(
    Icons.email_outlined,
    color: KColors.primaryColor,
    size: 18,
  );
  static Icon phoneIcon = const Icon(
    Icons.phone,
    color: KColors.primaryColor,
    size: 18,
  );
  static Icon AddressIcon = const Icon(
    Icons.location_on_outlined,
    color: KColors.primaryColor,
    size: 18,
  );
  //food icon
  static Icon foodIcon = const Icon(
    Icons.fastfood,
    color: KColors.primaryColor,
    size: 18,
  );
  //food description icon
  static Icon foodDescriptionIcon = const Icon(
    Icons.description,
    color: KColors.primaryColor,
    size: 18,
  );
  //food price icon
  static Icon foodPriceIcon = const Icon(
    Icons.attach_money,
    color: KColors.primaryColor,
    size: 18,
  );
  static Icon foodAvailabilityIcon = const Icon(
    Icons.check_circle_outline,
    color: KColors.primaryColor,
    size: 18,
  );

  // static Icon passwordIcon = const Icon(
  //   Iconsax.key,
  //   color: KColors.primaryColor,
  //   size: 18,
  // );
  static Icon visibleIcon = const Icon(
    Icons.visibility,
    color: Colors.black,
  );
  static Icon visibilityOffIcon = const Icon(
    Icons.visibility_off,
    color: Colors.grey,
  );
  static Icon dropDownIcon = const Icon(
    Icons.keyboard_arrow_down_rounded,
    size: 30,
    color: Colors.orangeAccent,
  );

  // padding
  static EdgeInsets contentPadding =
    const EdgeInsets.symmetric(horizontal: 20, vertical: 15);

  

// Dropdown item text style
static TextStyle dropdownItemTextStyle = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

}