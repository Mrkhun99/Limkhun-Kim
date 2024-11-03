import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pruducts'),
        ),
        backgroundColor: Colors.blue,
        body: Padding(padding: EdgeInsets.all(20),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [          
            Card(
              child:Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/IMG/dart.png',
                  width: 80,
                  height: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Dart',style: TextStyle(color: Colors.blue,fontSize: 30),),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            ),
            Card(
              child:Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/IMG/flutter.png',
                  width: 80,
                  height: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Flutter',style: TextStyle(color: Colors.blue,fontSize: 30),),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            ),
            Card(
              child:Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/IMG/firebase.png',
                  width: 80,
                  height: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Firebase',style: TextStyle(color: Colors.blue,fontSize: 30),),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            )
          ],
        ),),
      ),

  ));
}