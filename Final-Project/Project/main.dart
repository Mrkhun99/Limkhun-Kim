import 'package:flutter/material.dart';
import 'package:project/Project/screens/inventory.dart';
import 'package:project/Project/screens/startscreen.dart';

void main() {
  runApp( const FoodInventoryApp());
}

//  notification toggle
final ValueNotifier<bool> notificationsEnabled = ValueNotifier<bool>(true);

// defualt 3 day
ValueNotifier<int> alertThresholdDays = ValueNotifier<int>(3); 


class FoodInventoryApp extends StatelessWidget {
  const FoodInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Inventory Tracker',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Final Project")
        ),
        body: StartScreen(),
      ),
    );
  }
}
