import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

abstract class GetCurrentWeatherForPosition extends UseCase<CurrentWeatherResponse, Position> {}

class GetCurrentWeatherForPositionImpl extends GetCurrentWeatherForPosition {
  GetCurrentWeatherForPositionImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, CurrentWeatherResponse>> execute(Position position) {
    throw Exception();
    return _repository.getCurrentWeatherForPosition(
      lat: position.latitude,
      lon: position.longitude,
    );
  }
}
