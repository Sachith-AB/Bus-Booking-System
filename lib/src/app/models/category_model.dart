// models/category.dart
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String iconPath;
  final IconData icon;

  Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.icon
  });
}