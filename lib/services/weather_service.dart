import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'f18503d314cc479d9ef163703221507';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      var jsonData = data['forecast']['forecastday'][0]['day'];

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
