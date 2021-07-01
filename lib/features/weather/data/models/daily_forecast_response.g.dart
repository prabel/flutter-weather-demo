// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastResponse _$DailyForecastResponseFromJson(Map<String, dynamic> json) {
  return DailyForecastResponse(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    cod: json['cod'] as String,
    message: (json['message'] as num).toDouble(),
    cnt: json['cnt'] as int,
    list: (json['list'] as List<dynamic>).map((e) => DailyForecast.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$DailyForecastResponseToJson(DailyForecastResponse instance) => <String, dynamic>{
      'city': instance.city,
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
    };
