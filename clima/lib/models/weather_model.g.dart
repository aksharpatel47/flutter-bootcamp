// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String);
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon
    };

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) {
  return WeatherMain(
      temp: (json['temp'] as num)?.toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      temp_max: (json['temp_max'] as num)?.toDouble(),
      temp_min: (json['temp_min'] as num)?.toDouble());
}

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max
    };

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
      name: json['name'] as String,
      weather: (json['weather'] as List)
          ?.map((e) => e == null
              ? null
              : WeatherModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      main: json['main'] == null
          ? null
          : WeatherMain.fromJson(json['main'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main
    };
