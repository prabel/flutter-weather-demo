import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_information.g.dart';

@JsonSerializable()
class WeatherInformation {
  WeatherInformation({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherInformation.fromJson(Map<String, dynamic> json) => _$WeatherInformationFromJson(json);

  int id;
  String main;
  String description;
  String icon;
}
