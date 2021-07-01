import 'package:dartz/dartz.dart';
import 'package:weeath_app_demo/core/data/api/api_client.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this._apiClient, {required this.appId});

  final ApiClient _apiClient;
  final String appId;

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherForCity(
    String cityName,
  ) async {
    try {
      final responseBody = await _apiClient.get('weather', params: {
        'q': cityName,
        'appid': appId,
        'units': 'metric',
      });

      return Right(CurrentWeatherResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherForPosition({
    required double lat,
    required double lon,
  }) async {
    try {
      final responseBody = await _apiClient.get('weather', params: {
        'lat': lat,
        'lon': lon,
        'appid': appId,
        'units': 'metric',
      });

      return Right(CurrentWeatherResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }

  @override
  Future<Either<Failure, DailyForecastResponse>> getDailyForecastForCity(
    String cityName, {
    int numberOfDays = 16,
  }) async {
    try {
      final responseBody = await _apiClient.get('forecast/daily', params: {
        'q': cityName,
        'appid': appId,
        'cnt': numberOfDays,
        'units': 'metric',
      });

      return Right(DailyForecastResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }

  @override
  Future<Either<Failure, DailyForecastResponse>> getDailyForecastForPosition({
    required double lat,
    required double lon,
    int numberOfDays = 16,
  }) async {
    try {
      final responseBody = await _apiClient.get('forecast/daily',
          params: {'lat': lat, 'lon': lon, 'appid': appId, 'cnt': numberOfDays, 'units': 'metric'});

      return Right(DailyForecastResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }
}
