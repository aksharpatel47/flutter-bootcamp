import 'package:equatable/equatable.dart';
import 'package:weather_bloc/data/model/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {
  const InitialWeatherState();
  @override
  List<Object> get props => [];
}

class LoadingWeatherState extends WeatherState {
  const LoadingWeatherState();

  @override
  List<Object> get props => [];
}

class LoadedWeatherState extends WeatherState {
  final Weather weather;

  const LoadedWeatherState(this.weather);

  @override
  List<Object> get props => [weather];
}

class ErrorWeatherState extends WeatherState {
  final String message;

  const ErrorWeatherState(this.message);

  @override
  List<Object> get props => [message];
}

