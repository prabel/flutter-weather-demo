// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInformation _$WeatherInformationFromJson(Map<String, dynamic> json) {
  return WeatherInformation(
    id: json['id'] as int,
    main: json['main'] as String,
    description: json['description'] as String,
    icon: json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherInformationToJson(WeatherInformation instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
