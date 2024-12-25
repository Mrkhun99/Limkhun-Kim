import 'package:flutter/material.dart';
import '../model/food_item.dart';

class CategoryScreen extends StatelessWidget {
  final List<FoodItem> foodItems;

  const CategoryScreen({super.key, required this.foodItems});

  // set to different categories
  Map<String, List<FoodItem>> categorizeItems() {
    Map<String, List<FoodItem>> categorizedItems = {
      'Meat': [],
      'Vegetable': [],
      'Other': [],
    };

    for (var item in foodItems) {
      String category = getCategoryForItem(item);
      categorizedItems[category]?.add(item);
    }

    return categorizedItems;
  }

  // category based on its name
  String getCategoryForItem(FoodItem item) {
    String name = item.name.toLowerCase();
    if (name.contains('fish') || name.contains('meat') || name.contains('chicken')) {
      return 'Meat';  // Match any "meat" 
    } else if (name.contains('cabbage') || name.contains('carrot') || name.contains('spinach') || name.contains('lettuce') || name.contains('tomato') || name.contains('vegetable')) {
      return 'Vegetable';  // Match vegetable
    } else {
      return 'Other';  // Default category
    }
  }

  @override
  Widget build(BuildContext context) {
    // Categorize items
    final categorizedItems = categorizeItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.blue,

      ),
      body: ListView(
        children: [
          CategorySection(categoryName: 'Meat', items: categorizedItems['Meat'] ?? []),
          CategorySection(categoryName: 'Vegetable', items: categorizedItems['Vegetable'] ?? []),
          CategorySection(categoryName: 'Other', items: categorizedItems['Other'] ?? []),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<FoodItem> items;

  const CategorySection({super.key, required this.categoryName, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(categoryName),
      children: items.isEmpty
          ? [const ListTile(title: Text('No items available'))]
          : items.map((item) {
              final daysLeft = item.expirationDate.difference(DateTime.now()).inDays;
              final isExpiring = daysLeft <= 3; // Use a threshold for expiring items
              final iconColor = isExpiring ? Colors.red : Colors.green;

              return ListTile(
                title: Text('${item.name} (x${item.quantity})'),
                subtitle: Text('Expires in ${daysLeft > 0 ? daysLeft : 0} days'),
                trailing: Icon(Icons.warning, color: iconColor),
              );
            }).toList(),
    );
  }
}
