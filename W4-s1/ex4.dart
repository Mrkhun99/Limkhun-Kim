import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum WeatherCondition { sunny, rainy, cloudy, snowy }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Map<String, dynamic>> forecastData = [
    {
      "day": "Sun",
      "condition": WeatherCondition.sunny,
      "minTemp": 15,
      "maxTemp": 23,
    },
    {
      "day": "Mon",
      "condition": WeatherCondition.rainy,
      "minTemp": 12,
      "maxTemp": 19,
    },
    {
      "day": "Tue",
      "condition": WeatherCondition.cloudy,
      "minTemp": 9,
      "maxTemp": 17,
    },
    {
      "day": "Wed",
      "condition": WeatherCondition.snowy,
      "minTemp": 5,
      "maxTemp": 12,
    },
    {
      "day": "Thu",
      "condition": WeatherCondition.cloudy,
      "minTemp": 8,
      "maxTemp": 15,
    },
    {
      "day": "Fri",
      "condition": WeatherCondition.sunny,
      "minTemp": 4,
      "maxTemp": 14,
    },
    {
      "day": "Sat",
      "condition": WeatherCondition.sunny,
      "minTemp": 3,
      "maxTemp": 13,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weekly Weather Forecast'),
          backgroundColor: Colors.blue[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: forecastData.map((data) {
              return WeatherForecast(
                dayOfWeek: data["day"],
                condition: data["condition"],
                minTemp: data["minTemp"],
                maxTemp: data["maxTemp"],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  final String dayOfWeek;
  final WeatherCondition condition;
  final int minTemp;
  final int maxTemp;

  const WeatherForecast({
    required this.dayOfWeek,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (condition) {
      case WeatherCondition.sunny:
        icon = Icons.wb_sunny;
        break;
      case WeatherCondition.rainy:
        icon = Icons.beach_access;
        break;
      case WeatherCondition.cloudy:
        icon = Icons.cloud;
        break;
      case WeatherCondition.snowy:
        icon = Icons.ac_unit;
        break;
      default:
        icon = Icons.wb_sunny;
    }

    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dayOfWeek,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Icon(icon, color: Colors.orange, size: 32),
            SizedBox(height: 8),
            Text(
              '$minTemp° - $maxTemp°',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
