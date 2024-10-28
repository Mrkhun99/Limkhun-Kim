import 'package:flutter/material.dart';

void main(){
  runApp( MaterialApp(
    home: Scaffold(
     body: Container(
      padding: const EdgeInsets.all(40),
      color: Colors.blue,
      child: const Text("Hello Flutter",style: TextStyle(color:Colors.red, fontSize: 35, decoration: TextDecoration.none),),
     ),
    )
  ));
}
