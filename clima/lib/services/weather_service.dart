import 'package:clima/constants.dart';
import 'package:clima/models/weather_model.dart';
import 'package:clima/services/network_helper_service.dart';

Future<WeatherResponse> getWeatherFromCoordinate({double lat, double lon}) async {
    final url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
    final jsonData = await NetworkHelper().get(url);
    return WeatherResponse.fromJson(jsonData);
}

Future<WeatherResponse> getWeatherFromCity({String cityName}) async {
  final url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
  final jsonData = await NetworkHelper().get(url);
  return WeatherResponse.fromJson(jsonData);
}