import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weeath_app_demo/features/weather/data/models/main_weather_information.dart';
import 'package:weeath_app_demo/features/weather/data/models/weather_information.dart';

part 'current_weather_response.g.dart';

@JsonSerializable()
class CurrentWeatherResponse {
  CurrentWeatherResponse(
    this.weather,
    this.main,
    this.name,
    this.dt,
  );

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) => _$CurrentWeatherResponseFromJson(json);

  final List<WeatherInformation> weather;
  final MainWeatherInformation main;
  final int dt;
  final String name;
}
