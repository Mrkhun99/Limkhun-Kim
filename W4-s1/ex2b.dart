import 'package:flutter/material.dart';
enum Product{
  dart("Dart", "The best object-oriented language", "assets/IMG/dart.png"),
  flutter("Flutter", "The best mobile widget library", "assets/IMG/flutter.png"),
  firebase("Firebase", "the best cloud database", "assets/IMG/firebase.png");

  final String title;
  final String description;
  final String imagePath;
  const Product(this.title,this.description,this.imagePath);


}
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('products'),
        ),
        backgroundColor: Colors.blue,
        body: Padding(padding: EdgeInsets.all(20),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: Product.values.map((product){       
            return Card(
              child:Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(product.title,style: TextStyle(color: Colors.blue,fontSize: 30),),
                  SizedBox(
                    height: 5,
                  ),
                  Text(product.description)
                ],
              ),
            ),
            );
           
 } ).toList(),
            ),
          
        ),
        ),
      ),);
}