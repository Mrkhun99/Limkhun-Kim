import 'package:flutter/material.dart';
import '../model/food_item.dart';
import 'add_item.dart';
import 'category.dart'; 
import 'settings.dart'; 
import '../main.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<FoodItem> foodItems = [
    FoodItem(name: 'Fish', quantity: 2, expirationDate: DateTime.now().add(const Duration(days: 2))),
    FoodItem(name: 'Cabbage', quantity: 12, expirationDate: DateTime.now().add(const Duration(days: 5))),
    FoodItem(name: 'Cheese', quantity: 1, expirationDate: DateTime.now().add(const Duration(days: 1))),
  ];

  int get _expiringItemCount {
    final today = DateTime.now();
    final threshold = today.add(Duration(days: alertThresholdDays.value));
    return foodItems.where((item) => item.expirationDate.isBefore(threshold)).length;
  }

  List<FoodItem> get _expiringItems {
    final today = DateTime.now();
    final threshold = today.add(Duration(days: alertThresholdDays.value));
    return foodItems.where((item) => item.expirationDate.isBefore(threshold)).toList();
  }

  void addItemToCategory(String categoryName, FoodItem item) {
    final categoryIndex = categoryList.value.indexWhere((category) => category['name'] == categoryName);
    if (categoryIndex != -1) {
      final category = categoryList.value[categoryIndex];
      (category['items'] as List<FoodItem>).add(item);
    } else {
      categoryList.value.add({
        'name': categoryName,
        'items': [item],
      });
    }
    categoryList.notifyListeners();
  }

  String getCategoryForItem(FoodItem item) {
    if (item.name.toLowerCase().contains('fish') || item.name.toLowerCase().contains('meat')) {
      return 'Meat';
    } else if (item.name.toLowerCase().contains('cabbage') || item.name.toLowerCase().contains('vegetable')) {
      return 'Vegetable';
    } else {
      return 'Other';
    }
  }

  void _addItem(Map<String, dynamic> newItem) {
    setState(() {
      final item = FoodItem(
        name: newItem['name'],
        quantity: newItem['quantity'],
        expirationDate: newItem['expirationDate'],
      );
      foodItems.add(item);
      String category = getCategoryForItem(item);
      addItemToCategory(category, item);
    });
  }

  void _editItem(FoodItem oldItem, Map<String, dynamic> updatedItem) {
    setState(() {
      // Update the item in the list
      final index = foodItems.indexOf(oldItem);
      if (index != -1) {
        final updatedFoodItem = FoodItem(
          name: updatedItem['name'],
          quantity: updatedItem['quantity'],
          expirationDate: updatedItem['expirationDate'],
        );
        foodItems[index] = updatedFoodItem;

        // Update category assignment
        String oldCategory = getCategoryForItem(oldItem);
        String newCategory = getCategoryForItem(updatedFoodItem);

        if (oldCategory != newCategory) {
          // Remove from old category
          final oldCategoryIndex = categoryList.value.indexWhere((cat) => cat['name'] == oldCategory);
          if (oldCategoryIndex != -1) {
            (categoryList.value[oldCategoryIndex]['items'] as List<FoodItem>).remove(oldItem);
          }

          // Add to new category
          addItemToCategory(newCategory, updatedFoodItem);
        } else {
          // Update within the same category
          final categoryIndex = categoryList.value.indexWhere((cat) => cat['name'] == oldCategory);
          if (categoryIndex != -1) {
            final items = categoryList.value[categoryIndex]['items'] as List<FoodItem>;
            final itemIndex = items.indexOf(oldItem);
            if (itemIndex != -1) {
              items[itemIndex] = updatedFoodItem;
            }
          }
        }
        categoryList.notifyListeners();
      }
    });
  }

  void _deleteItem(FoodItem item) {
    setState(() {
      foodItems.remove(item);
      for (var category in categoryList.value) {
        (category['items'] as List<FoodItem>).remove(item);
      }
      categoryList.notifyListeners();
    });
  }

  @override
  void initState() {
    super.initState();
    for (var item in foodItems) {
      String category = getCategoryForItem(item);
      addItemToCategory(category, item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: Colors.blue,
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: notificationsEnabled,
            builder: (context, isEnabled, _) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: isEnabled && _expiringItemCount > 0
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Expiring Items'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: _expiringItems.map((item) {
                                    final daysLeft = item.expirationDate.difference(DateTime.now()).inDays;
                                    return ListTile(
                                      title: Text(item.name),
                                      subtitle: Text(
                                        'Quantity: ${item.quantity}\nExpires in ${daysLeft > 0 ? daysLeft : 0} days',
                                      ),
                                    );
                                  }).toList(),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                  ),
                  if (_expiringItemCount > 0 && isEnabled)
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 15,
                          minHeight: 15,
                        ),
                        child: Text(
                          '$_expiringItemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryScreen(foodItems: foodItems)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final foodItem = foodItems[index];
          final daysLeft = foodItem.expirationDate.difference(DateTime.now()).inDays;
          final isExpiring = daysLeft <= alertThresholdDays.value;
          final iconColor = isExpiring ? Colors.red : Colors.green;

          return ListTile(
            title: Text('${foodItem.name} (x${foodItem.quantity})'),
            subtitle: Text('Expires in ${daysLeft > 0 ? daysLeft : 0} days'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddItemScreen(
                          onAddItem: (updatedItem) => _editItem(foodItem, updatedItem),
                          isEditing: true,
                          existingItem: foodItem,
                        ),
                      ),
                    );
                    if (result != null) {
                      _editItem(foodItem, result);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteItem(foodItem),
                ),
              ],
            ),
            leading: Icon(Icons.inventory, color: iconColor),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemScreen(
                onAddItem: _addItem,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
