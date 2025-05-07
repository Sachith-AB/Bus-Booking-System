import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 3,
      body: Scaffold(
        appBar: CustomAppBar(
          title: 'Profile',
          showBackButton: false,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade100,
        ),
      )
    );
  }
}