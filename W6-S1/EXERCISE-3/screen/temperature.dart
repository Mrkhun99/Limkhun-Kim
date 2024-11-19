import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final TextEditingController _controller = TextEditingController();
  String fahrenheitValue = "0";

  // Function to handle conversion
  void _convertToFahrenheit(String value) {
    if (value.isEmpty) {
      setState(() {
        fahrenheitValue = "0";
      });
      return;
    }

    try {
      double celsius = double.parse(value);
      double fahrenheit = (celsius * 9 / 5) + 32;
      setState(() {
        fahrenheitValue = fahrenheit.toStringAsFixed(2); // Display 2 decimal places
      });
    } catch (e) {
      setState(() {
        fahrenheitValue = "Invalid Input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration textDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );

    final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white),
    );

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Temperature in Degrees:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              onChanged: _convertToFahrenheit, // Handle input changes
            ),
            const SizedBox(height: 30),
            const Text(
              "Temperature in Fahrenheit:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                fahrenheitValue,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
