import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_weather_information.g.dart';

@JsonSerializable()
class MainWeatherInformation {
  MainWeatherInformation(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  );

  factory MainWeatherInformation.fromJson(Map<String, dynamic> json) => _$MainWeatherInformationFromJson(json);

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
}
