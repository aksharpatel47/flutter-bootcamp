import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_bloc/data/weather_repository.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository);

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield LoadingWeatherState();

    if (event is GetWeather) {
      try {
        final weather = await repository.fetchWeather(event.cityName);
        yield LoadedWeatherState(weather);
      } on NetworkError {
        yield ErrorWeatherState("Couldn't fetch answer. Is the device online?");
      }
    } else if (event is GetDetailedWeather) {
      try {
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield LoadedWeatherState(weather);
      } on NetworkError {
        yield ErrorWeatherState("Couldn't fetch answer. Is the device online?");
      }
    }
  }
}
