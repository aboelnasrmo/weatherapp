import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/providers/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
