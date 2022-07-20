import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? const Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  'There is no weather 😔 , start searching now 🔍',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          : Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    '${Provider.of<WeatherProvider>(context, listen: true).weatherData!.name}',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${Provider.of<WeatherProvider>(context, listen: true).weatherData!.date}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .getImage()),
                      Text(
                        '${Provider.of<WeatherProvider>(context, listen: true).weatherData!.temp}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max Temp : ${Provider.of<WeatherProvider>(context, listen: true).weatherData!.maxTemp}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Min Temp : ${Provider.of<WeatherProvider>(context, listen: true).weatherData!.minTemp}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                  Text(
                    '${Provider.of<WeatherProvider>(context, listen: true).weatherData!.weatherStateName}',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
    );
  }
}
