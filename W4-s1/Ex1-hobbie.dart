import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My Hobbies'),
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Center(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.travel_explore),
                  ),
                  Text('Travelling'),
                ],
              ),
            ),
          ),

          Container(
           margin: EdgeInsets.fromLTRB(0,10,0,0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Center(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.skateboarding),
                  ),
                  Text('Skating'),
                ],
              ),
            ),
          ),
          
          Container(
           margin: EdgeInsets.fromLTRB(0,10,0,40),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Center(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.hiking),
                  ),
                  Text('Hiking'),
                ],
              ),
            ),
          ),
          
        ],
      ),
      ),
    ),
  ));
}