import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WeatherData weatherData;
  bool isLoading = false;
  final List<String> _cities = ['São Paulo', 'London', 'New York'];
  String _selectedCity = 'São Paulo';

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    String apiKey = '1ee6499eee18e8165e749b2ce1d6d629';
    String language = 'pt_br';
    String units = 'metric';

    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'appid': apiKey,
      'q': _selectedCity,
      'units': units,
      'lang': language
    });

    final weatherResponse = await http.get(url);

    if (weatherResponse.statusCode == 200) {
      return setState(() {
        weatherData = WeatherData.fromJson(jsonDecode(weatherResponse.body));
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedCity,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch(
              items: _cities,
              onChanged: ((value) => {
                    setState(() {
                      _selectedCity = value!;
                    })
                  }),
              selectedItem: _selectedCity,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      icon: Icon(
                Icons.location_on,
              ))),
            )
          ],
        ),
      ),
    );
  }
}
