import 'package:flutter/widgets.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
