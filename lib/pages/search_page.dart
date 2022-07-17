import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search by City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              hintText: 'Enter a City',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (data) {
              cityName = data;
              WeatherService service = WeatherService();
              service.getWeather(cityName: cityName!);
            },
          ),
        ),
      ),
    );
  }
}
