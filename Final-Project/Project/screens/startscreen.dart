import 'package:flutter/material.dart';
import 'inventory.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InventoryScreen()),
          );
        },
        child: Text("Start Project"), 
        
      ),
    );
  }
}