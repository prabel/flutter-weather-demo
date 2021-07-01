import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weeath_app_demo/features/weather/data/models/temperature.dart';
import 'package:weeath_app_demo/features/weather/data/models/weather_information.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
class DailyForecast {
  DailyForecast(
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.rain,
  );

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

  final int dt;
  final int sunrise;
  final int sunset;
  final Temperature temp;
  final int? pressure;
  final int? humidity;
  final List<WeatherInformation> weather;
  final double? speed;
  final int? deg;
  final double? gust;
  final int? clouds;
  final double? pop;
  final double? rain;
}
