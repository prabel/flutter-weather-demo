// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponse _$CurrentWeatherResponseFromJson(Map<String, dynamic> json) {
  return CurrentWeatherResponse(
    (json['weather'] as List<dynamic>).map((e) => WeatherInformation.fromJson(e as Map<String, dynamic>)).toList(),
    MainWeatherInformation.fromJson(json['main'] as Map<String, dynamic>),
    json['name'] as String,
    json['dt'] as int,
  );
}

Map<String, dynamic> _$CurrentWeatherResponseToJson(CurrentWeatherResponse instance) => <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'dt': instance.dt,
      'name': instance.name,
    };
