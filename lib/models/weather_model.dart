import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String name;

  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0];
    return WeatherModel(
      weatherStateName: jsonData['day']['condition']['text'],
      date: jsonData['date'],
      temp: jsonData['day']['avgtemp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      maxTemp: jsonData['day']['maxtemp_c'],
      name: data['location']['name'],
    );

    // return WeatherModel(
    //     weatherStateName: data['current']['condition']['text'],
    //     date: data['location']['localtime'],
    //     temp: jsonData['avgtemp_c'],
    //     minTemp: jsonData['mintemp_c'],
    //     maxTemp: jsonData['maxtemp_c'],
    //     name: data['location']['name']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp minTem=$minTemp maxtemp=$maxTemp date=$date name=$name weatherStateName=$weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
