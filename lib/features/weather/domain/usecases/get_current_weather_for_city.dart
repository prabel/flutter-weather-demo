import 'package:dartz/dartz.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

abstract class GetCurrentWeatherForCity extends UseCase<CurrentWeatherResponse, String> {}

class GetCurrentWeatherForCityImpl extends GetCurrentWeatherForCity {
  GetCurrentWeatherForCityImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, CurrentWeatherResponse>> execute(String params) {
    return _repository.getCurrentWeatherForCity(params);
  }
}
