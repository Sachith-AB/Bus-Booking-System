import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String? iconFontFamily;
  final String? iconCode;
  final IconData? icon;
  

  Category({
    required this.id,
    required this.name,
    this.iconFontFamily,
    this.iconCode,
    this.icon,
  });

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'iconCode': icon?.codePoint,
    'iconFontFamily': icon?.fontFamily ?? 'MaterialIcons', // fallback
  };
}


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: IconData(
        json['iconCode'],
        fontFamily: json['iconFontFamily'],
      ),
    );
  }
}
