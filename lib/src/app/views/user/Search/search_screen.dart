import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/main_scaffold.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      selectedIndex: 1,
      body: Scaffold(
        appBar: CustomAppBar(
          title: 'Search',
          showBackButton: false,
          showCartButton: true,
          backgroundColor: KColors.appPrimary.shade100,
        ),
      )
    );
  }
}