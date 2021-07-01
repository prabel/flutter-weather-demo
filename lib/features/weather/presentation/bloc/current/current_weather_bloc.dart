import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';
import 'package:weeath_app_demo/features/weather/domain/usecases/get_current_weather_for_position.dart';

part 'current_weather_bloc.freezed.dart';

part 'current_weather_state.dart';

class CurrentWeatherBloc extends Cubit<CurrentWeatherState> {
  @visibleForTesting
  CurrentWeatherBloc(this._getCurrentWeatherForPosition) : super(const CurrentWeatherState.initial());

  factory CurrentWeatherBloc.fromContext(BuildContext context) {
    return CurrentWeatherBloc(
      GetCurrentWeatherForPositionImpl(
        context.read<WeatherRepository>(),
      ),
    );
  }

  final GetCurrentWeatherForPosition _getCurrentWeatherForPosition;

  Future<void> load(Position position) async {
    emit(const CurrentWeatherState.loading());

    try {
      final Either<Failure, CurrentWeatherResponse> eitherResults =
          await _getCurrentWeatherForPosition.execute(position);
      eitherResults.fold(
        (Failure failure) => emit(CurrentWeatherState.failed(failure)),
        (CurrentWeatherResponse weather) => emit(CurrentWeatherState.weather(weather)),
      );
    } catch (e) {
      emit(CurrentWeatherState.failed(ClientFailure(e)));
    }
  }
}
