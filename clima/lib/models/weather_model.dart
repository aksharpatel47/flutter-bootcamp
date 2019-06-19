import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class WeatherMain {
  final double temp;
  final int pressure;
  final int humidity;
  final double temp_min;
  final double temp_max;

  WeatherMain({this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min});

  factory WeatherMain.fromJson(Map<String, dynamic> json) => _$WeatherMainFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}

@JsonSerializable()
class WeatherResponse {
  final String name;
  final List<WeatherModel> weather;
  final WeatherMain main;

  WeatherResponse({this.name, this.weather, this.main});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}