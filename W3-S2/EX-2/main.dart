import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(50),
      color: Colors.blue[300],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[600], borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            "Amazon",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    ),
  ));
}


