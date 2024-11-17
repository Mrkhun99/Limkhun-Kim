import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Method 1: Loop in Array",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...method1LoopInArray(),

            
            Text(
              "Method 2: Map",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...method2UsingMap(),

            Text(
              "Method 3: Dedicated Function",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...method3DedicatedFunction(),
          ],
        ),
      ),
    ),
  ));
}

List<Widget> method1LoopInArray() {
  List<Widget> widgets = [];
  for (var color in colors) {
    widgets.add(
      Text(
        color,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
  return widgets;
}

List<Widget> method2UsingMap() {
  return colors.map((color) {
    return Text(
      color,
      style: const TextStyle(fontSize: 16),
    );
  }).toList();
}

List<Widget> method3DedicatedFunction() {
  return buildColorWidgets();
}

List<Widget> buildColorWidgets() {
  return colors.map((color) {
    return Text(
      color,
      style: const TextStyle(fontSize: 16),
    );
  }).toList();
}
