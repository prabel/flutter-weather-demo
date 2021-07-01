import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);

  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;
}
