import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Mumbai';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return {
        'cityName': cityName,
        'weatherModel': WeatherModel.fromMap(data),
      };
    } catch (e) {
      throw e.toString();
    }
  }
}
