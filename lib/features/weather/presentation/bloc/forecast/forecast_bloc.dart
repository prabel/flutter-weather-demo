import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';
import 'package:weeath_app_demo/features/weather/domain/usecases/get_daily_forecast_for_city.dart';

part 'forecast_bloc.freezed.dart';

part 'forecast_state.dart';

class ForecastBloc extends Cubit<ForecastState> {
  @visibleForTesting
  ForecastBloc(this._getDailyForecastForCity) : super(const ForecastState.initial());

  factory ForecastBloc.fromContext(BuildContext context) {
    return ForecastBloc(
      GetDailyForecastForCityImpl(
        context.read<WeatherRepository>(),
      ),
    );
  }

  final GetDailyForecastForCity _getDailyForecastForCity;

  Future<void> load(String location) async {
    emit(const ForecastState.loading());

    try {
      final Either<Failure, DailyForecastResponse> eitherResults = await _getDailyForecastForCity.execute(location);
      eitherResults.fold(
        (Failure failure) => emit(ForecastState.failed(failure)),
        (DailyForecastResponse forecast) => emit(ForecastState.forecast(forecast)),
      );
    } catch (e) {
      emit(ForecastState.failed(ClientFailure(e)));
    }
  }
}
