import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City({
    required this.id,
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  final int id;
  final String name;
  final String country;
  final int population;
  final int timezone;
}
