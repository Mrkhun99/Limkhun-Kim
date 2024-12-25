import 'package:flutter/material.dart';

class FoodItem {
  final String name;
  final int quantity;
  final DateTime expirationDate;

  FoodItem({
    required this.name,
    required this.quantity,
    required this.expirationDate,
  });
}

// Global categories 
final ValueNotifier<List<Map<String, dynamic>>> categoryList = ValueNotifier<List<Map<String, dynamic>>>([
  {'name': 'Meat', 'items': <FoodItem>[]},
  {'name': 'Vegetable', 'items': <FoodItem>[]},
  {'name': 'Other', 'items': <FoodItem>[]},
]);