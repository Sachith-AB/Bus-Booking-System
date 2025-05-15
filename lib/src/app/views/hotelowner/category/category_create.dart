import 'package:bus_booking/src/app/controllers/hotelOwner/create_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking/src/app/components/custom_dynamic_form.dart';
import 'package:bus_booking/src/app/components/custom_app_bar.dart';
import 'package:bus_booking/src/app/components/input_field_config.dart';
import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:bus_booking/src/utils/color/colors.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:get/get.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({super.key});

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final controller = Get.put(AddCategoryController());


  final TextEditingController nameController = TextEditingController();
  IconData? selectedIcon;

  // List of available icon choices
  final List<IconData> iconOptions = const [
    Icons.coffee_outlined,
    Icons.bakery_dining,
    Icons.set_meal,
    Icons.donut_large,
    Icons.fastfood,
    Icons.emoji_food_beverage,
    Icons.local_pizza,
    Icons.lunch_dining,
    Icons.icecream,
    Icons.cake,
  ];

  void createCategory() {
    final name = nameController.text.trim();

    if (name.isEmpty || selectedIcon == null) {
      PopupWarning.Warning(
        title: 'Missing Information',
        message: 'Please provide a category name and select an icon.',
        type: 1,
      );
      return;
    }
    controller.createCategory(
      name: name,
      icon: selectedIcon!,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.white,
      appBar: CustomAppBar(
        title: 'Create Category',
        backgroundColor: KColors.appPrimary.shade100,
        showBackButton: true,
        showAddfoodButton: false,
        showCartButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 120),
            DynamicForm(
              fields: [
                InputFieldConfig(
                  controller: nameController,
                  labelText: "Category Name",
                  hintText: "Enter category name",
                  isValid: false,
                  onChanged: (_) {},
                  prefixIcon: const Icon(Icons.label_outline),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Icon",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: iconOptions.map((iconData) {
                final isSelected = iconData == selectedIcon;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIcon = iconData;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? KColors.appPrimary.shade100 : KColors.white,
                      border: Border.all(
                        color: isSelected ? KColors.appPrimary : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      iconData,
                      size: 28,
                      color: isSelected ? KColors.appPrimary : Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              label: 'Create Category',
              onPressed: createCategory,
            ),
          ],
        ),
      ),
    );
  }
}
