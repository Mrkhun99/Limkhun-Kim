import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),   
    child: Center(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),//left top right bottom 
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none, //remove underline
                      fontSize: 20),
                ),
              )),
          Container(
            
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),//left top right bottom 
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "DART",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,//remove underline
                      fontSize: 20),
                ),
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),//left top right bottom 
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.black,
                  ],
                ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,  //remove underline
                      fontSize: 20),
                ),
              )),
        ],
      ),
    ),
  )));
}