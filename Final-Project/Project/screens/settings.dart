import 'package:flutter/material.dart';
import '../main.dart'; // Import global state

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _alertThresholdDays = alertThresholdDays.value;  // global alert threshold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        
      ),
      body: ListView(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: notificationsEnabled, // global state
            builder: (context, isEnabled, _) {
              return SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive alerts for expiring items'),
                value: isEnabled,
                onChanged: (bool value) {
                  notificationsEnabled.value = value; // Update global state
                },
              );
            },
          ),
          ListTile(
            title: const Text('Set Alert Threshold'),
            subtitle: Text('Currently: $_alertThresholdDays days before expiration'),
            trailing: const Icon(Icons.edit),
            onTap: () async {
              final newThreshold = await showDialog<int>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Set Alert Threshold'),
                  content: DropdownButton<int>(
                    value: _alertThresholdDays,
                    items: [1, 2, 3, 5, 7].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value days'),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        Navigator.pop(context, newValue);
                      }
                    },
                  ),
                ),
              );
              if (newThreshold != null) {
                setState(() {
                  _alertThresholdDays = newThreshold;
                });
              }
            },
          ),
          // Save Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Save global state
                alertThresholdDays.value = _alertThresholdDays;

                // confirm changes
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings Saved!')),
                );

                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }
}
