import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class WeatherData {
  final double? temp;
  final double? tempMax;
  final double? tempMin;
  final String? descTemp;
  final String? icon;
  final int? humidity;

  WeatherData(
      {this.descTemp,
      this.temp,
      this.humidity,
      this.icon,
      this.tempMax,
      this.tempMin});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temp: json['main']['temp'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      descTemp: toBeginningOfSentenceCase(json['weather'][0]['description']),
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'].toInt(),
    );
  }
}
