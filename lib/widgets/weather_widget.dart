import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class Weather extends StatelessWidget {
  final WeatherData temperature;

  const Weather({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('http://openweathermap.org/img/w/${temperature.icon}.png',
            fit: BoxFit.fill, width: 80.0),
        Text(
          '${temperature.temp?.toStringAsFixed(0)} ºC',
          style: const TextStyle(fontSize: 50.0),
        ),
        Text(
          temperature.descTemp!,
          style: const TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Min. do dia: ${temperature.tempMin?.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          'Max. do dia: ${temperature.tempMax?.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          'Umidade do ar: ${temperature.humidity?.toStringAsFixed(0)}%',
        )
      ],
    );
  }
}
