import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomCard(
                text: 'welcome',
                startColor: Colors.blue,
                endColor: Colors.red),
            CustomCard(
                text: 'Goodluck',
                startColor: Colors.green,
                endColor: Colors.purple),
            CustomCard(
                text: 'Goodbye',
                startColor: Colors.yellow,
                endColor: Colors.orange),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    required this.startColor,
    required this.endColor,
  });
  final String text;
  final Color startColor;
  final Color endColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(colors: [
            startColor,
            endColor,
          ])),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 35, decoration: TextDecoration.none),
      ),
    );
  }
}