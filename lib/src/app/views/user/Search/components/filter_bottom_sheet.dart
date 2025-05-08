import 'package:bus_booking/src/app/components/custom_dropdown.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedSort = 'Price: Low to High';
  final List<String> sortOptions = [
    'Price: Low to High',
    'Price: High to Low',
    'Newest First',
  ];
  
  // Add state for range slider
  RangeValues priceRange = const RangeValues(1, 5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Text("Filter Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            const Text("Sort By"),
            const SizedBox(height: 8),
            CustomDropdown(
              value: selectedSort,
              items: sortOptions,
              onChanged: (value) {
                setState(() {
                  selectedSort = value!;
                });
              },
              label: 'Sort By',
              icon: Icons.check_circle_outline,
            ),
            const SizedBox(height: 20),
            
            const Text("Price Range"),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 10,
              divisions: 10,
              labels: RangeLabels('\$${priceRange.start.toInt()}', '\$${priceRange.end.toInt()}'),
              activeColor: KColors.appPrimary,
              inactiveColor: KColors.appPrimary.shade100,
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Apply Filter',
              onPressed: () {
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}