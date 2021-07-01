// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) {
  return DailyForecast(
    json['dt'] as int,
    json['sunrise'] as int,
    json['sunset'] as int,
    Temperature.fromJson(json['temp'] as Map<String, dynamic>),
    json['pressure'] as int?,
    json['humidity'] as int?,
    (json['weather'] as List<dynamic>).map((e) => WeatherInformation.fromJson(e as Map<String, dynamic>)).toList(),
    (json['speed'] as num?)?.toDouble(),
    json['deg'] as int?,
    (json['gust'] as num?)?.toDouble(),
    json['clouds'] as int?,
    (json['pop'] as num?)?.toDouble(),
    (json['rain'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'weather': instance.weather,
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
    };
