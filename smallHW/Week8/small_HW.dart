import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ExpenseItem(
          title: "Ronan The Best Book",
          amount: 15000.0,
          date: DateTime(2024, 11, 9),
          categoryIcon: Icons.book, // Icon representing category
        ),
      ),
    ),
  ));
}

class ExpenseItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final IconData categoryIcon;

  const ExpenseItem({
    required this.title,
    required this.amount,
    required this.date,
    required this.categoryIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50], // Light blue background
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Left: Title and Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0), // Space between title and price
              Text(
                "\$${amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          // Spacer to create space between the left and right content
          const Spacer(),

          // Right: Icon and Date
          Row(
            children: [
              // Icon based on the category
              Icon(
                categoryIcon,
                size: 28.0,
                color: Colors.black54,
              ),
              const SizedBox(width: 8.0), // Space between icon and date
              // Date formatted using intl package
              Text(
                DateFormat.yMd().format(date), // Format: MM/dd/yyyy
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
