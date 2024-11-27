import 'package:application_2/W8-S1_SHW/screens/expense_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('The best expenses app'),
          backgroundColor: Colors.blue,
        ),
        body: const ExpenseView(),
      ),
    ),
  );
}
