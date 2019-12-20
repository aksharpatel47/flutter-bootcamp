import 'dart:math';

import 'package:weather_bloc/data/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailedWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelcius;

  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkError();
      }

      cachedTempCelcius = 20 + random.nextInt(15) + random.nextDouble();

      return Weather(
        cityName: cityName,
        temperatureCelsius: cachedTempCelcius,
      );
    });
  }

  @override
  Future<Weather> fetchDetailedWeather(String cityName) {
    return Future.delayed(Duration(seconds: 0), () {
      return Weather(
        cityName: cityName,
        temperatureCelsius: cachedTempCelcius,
        temperatureFahrenheit: cachedTempCelcius * 1.8 + 32,
      );
    });
  }
}

class NetworkError extends Error {}
