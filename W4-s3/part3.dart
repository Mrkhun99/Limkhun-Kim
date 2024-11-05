import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
            ],
          ),
        ),
      ),
    ));

class SelectButton extends StatefulWidget {
  const SelectButton({Key? key}) : super(key: key);

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool _btn = true;
  bool _btn2 = false;


  void _toggleSelection() {
    setState(() {
      _btn = !_btn;
    });
    setState(() {
      _btn2 = !_btn2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: _toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: _btn ? Colors.blue : Colors.grey,
          foregroundColor: _btn ? Colors.white : Colors.black,
        ),
        child: Text(_btn ? "Selected" : "Not Selected"),
      ),
    );
  }
}
