class WeatherModel {
  String weatherStateName;
  String date;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // temp = jsonData['avgtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // maxTemp = jsonData['maxtemp_c'];
    // weatherStateName = data['current']['condition']['text'];
    // date = data['location']['localtime'];

    return WeatherModel(
        weatherStateName: data['current']['condition']['text'],
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp minTem=$minTemp date=$date';
  }
}
