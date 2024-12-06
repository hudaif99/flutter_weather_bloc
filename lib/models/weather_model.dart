// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  final List hourlyWeather;
  final double hourlyTemp;
  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyWeather,
    required this.hourlyTemp,
  });

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
    List? hourlyWeather,
    double? hourlyTemp,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      hourlyTemp: hourlyTemp ?? this.hourlyTemp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'hourlyWeather': hourlyWeather,
      'hourlyTemp': hourlyTemp,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    print(map);
    final currentWeatherData = map;
    return WeatherModel(
      currentTemp: currentWeatherData['list'][0]['main']['temp'],
      currentSky: currentWeatherData['list'][0]['weather'][0]['main'],
      currentPressure:
          (currentWeatherData['list'][0]['main']['pressure']).toDouble(),
      currentWindSpeed:
          (currentWeatherData['list'][0]['wind']['speed']).toDouble(),
      currentHumidity:
          (currentWeatherData['list'][0]['main']['humidity']).toDouble(),
      hourlyWeather: currentWeatherData['list'] as List,
      hourlyTemp: (currentWeatherData['list'][0]['main']['temp']).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity, hourlyWeather: $hourlyWeather, hourlyTemp: $hourlyTemp)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity &&
        listEquals(other.hourlyWeather, hourlyWeather) &&
        other.hourlyTemp == hourlyTemp;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode ^
        hourlyWeather.hashCode ^
        hourlyTemp.hashCode;
  }
}
