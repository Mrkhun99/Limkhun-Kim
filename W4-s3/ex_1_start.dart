import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
            child: SelectButton(),
        ),
      ),
    ));

  class SelectButton extends StatefulWidget{
    @override
    _btnState createState() => _btnState();
  }

  class _btnState extends State<SelectButton>{
    bool _btn = false;

    void _press(){
      setState(() {
        _btn = !_btn;
      });
    }

    @override
    Widget build(BuildContext context){
      return SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    onPressed: _press,  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _btn ? Colors.grey : Colors.blue,
                      foregroundColor: _btn ? Colors.white : Colors.white,
                    ),
                child: Text(_btn ? "Not Selected" : "Selected"),
                    
                )
      );
    }

  }


