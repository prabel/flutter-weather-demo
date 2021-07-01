import 'package:dartz/dartz.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

abstract class GetDailyForecastForCity extends UseCase<DailyForecastResponse, String> {}

class GetDailyForecastForCityImpl extends GetDailyForecastForCity {
  GetDailyForecastForCityImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, DailyForecastResponse>> execute(String params) {
    return _repository.getDailyForecastForCity(params, numberOfDays: 16);
  }
}
