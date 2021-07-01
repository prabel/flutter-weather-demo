import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast.dart';

import 'city.dart';

part 'daily_forecast_response.g.dart';

@JsonSerializable()
class DailyForecastResponse {
  DailyForecastResponse({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory DailyForecastResponse.fromJson(Map<String, dynamic> json) => _$DailyForecastResponseFromJson(json);

  final City city;
  final String cod;
  final double message;
  final int cnt;
  final List<DailyForecast> list;
}
