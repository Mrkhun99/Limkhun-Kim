import 'package:flutter/material.dart';
import '../model/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback? onWarning; // triggered if the item is expiring soon.

  const FoodItemCard({super.key, required this.foodItem, this.onWarning});

  @override
  Widget build(BuildContext context) {
    final daysLeft = foodItem.expirationDate.difference(DateTime.now()).inDays;

    return GestureDetector(
      onTap: onWarning, // Trigger warning 
      child: Card(
        child: ListTile(
          title: Text(foodItem.name),
          subtitle: Text(
              'Quantity: ${foodItem.quantity}\nExpires in: ${daysLeft > 0 ? daysLeft : 0} days'),
          trailing: Icon(
            Icons.warning,
            color: daysLeft <= 3 ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
