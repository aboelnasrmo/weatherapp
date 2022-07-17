import 'package:flutter/material.dart';
import 'package:weatherapp/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Text(
            'There is no weather 😔 , start searching now 🔍',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
