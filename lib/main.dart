import 'package:flutter/material.dart';
import 'package:weather_app/weatherapp/screens/searchscreen.dart';
import 'package:weather_app/weatherapp/screens/weatherscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WeatherSearch(),
    );
  }
}

