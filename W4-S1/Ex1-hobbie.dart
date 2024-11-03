import 'package:flutter/material.dart';

void main() {
  runApp(Myhobbie());
}

class Myhobbie extends StatefulWidget{
  @override
  State<Myhobbie> createState() => _MyhobbieState();
}

class _MyhobbieState extends State<Myhobbie> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text("My Hobbies"),
          backgroundColor: Colors.purple[50],
             
        ),
        body: Padding(padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HobbyCard(
              icon:Icons.travel_explore,
              text: ("Travelling"),
              color: Colors.green,
            ),
            
            SizedBox(height: 10,),

            HobbyCard(
              icon:Icons.skateboarding,
              text:("Skating"),
              color:Colors.grey,
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget{
  
  final IconData icon;
  final String text;
  final Color color;

  const HobbyCard({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon,color: Colors.white, size: 30),
          SizedBox(width: 20),
          Text(
            text, style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

