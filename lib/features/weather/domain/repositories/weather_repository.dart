import 'package:dartz/dartz.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherForCity(
    String cityName,
  );

  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherForPosition({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, DailyForecastResponse>> getDailyForecastForCity(
    String cityName, {
    int numberOfDays = 16,
  });

  Future<Either<Failure, DailyForecastResponse>> getDailyForecastForPosition({
    required double lat,
    required double lon,
    int numberOfDays = 16,
  });
}
