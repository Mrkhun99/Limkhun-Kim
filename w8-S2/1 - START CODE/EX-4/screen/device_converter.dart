import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _dollarController = TextEditingController();
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  String _selectedDevice = 'EURO'; // Default selected device
  double _convertedAmount = 0.0;

  // Conversion rates
  final Map<String, double> conversionRates = {
    'EURO': 0.9,
    'RIELS': 4100.0,
    'DONG': 23000.0,
  };

  void _convertAmount() {
    final dollarAmount = double.tryParse(_dollarController.text) ?? 0.0;
    final rate = conversionRates[_selectedDevice] ?? 1.0;

    setState(() {
      _convertedAmount = dollarAmount * rate;
    });
  }

  @override
  void initState() {
    super.initState();
    _dollarController.addListener(_convertAmount);
  }

  @override
  void dispose() {
    _dollarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),

            // Dollar TextField
            TextField(
              controller: _dollarController,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollars',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),

            const SizedBox(height: 30),

            // Dropdown for selecting device
            const Text("Device:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedDevice,
              dropdownColor: Colors.orange,
              style: const TextStyle(color: Colors.white),
              items: conversionRates.keys.map((String device) {
                return DropdownMenuItem<String>(
                  value: device,
                  child: Text(
                    device,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedDevice = newValue!;
                });
                _convertAmount(); // Recalculate on device change
              },
            ),

            const SizedBox(height: 30),

            // Converted Amount Display
            const Text("Amount in selected device:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount.toStringAsFixed(2),
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
