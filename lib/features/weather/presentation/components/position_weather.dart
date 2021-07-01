import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/common/presentation/components/failure_view.dart';
import 'package:weeath_app_demo/features/common/presentation/components/progress_view.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/presentation/bloc/current/current_weather_bloc.dart';
import 'package:weeath_app_demo/features/weather/presentation/components/current_weather_view.dart';

class PositionWeather extends StatelessWidget {
  const PositionWeather({
    Key? key,
    required this.position,
  }) : super(key: key);

  final Position position;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CurrentWeatherBloc.fromContext(context)..load(position),
      child: Builder(
        builder: (BuildContext context) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (BuildContext context, CurrentWeatherState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          weather: (CurrentWeatherResponse weather) => CurrentWeatherView(weather),
          failed: (Failure failure) => FailureView(failure: failure),
        );
      },
    );
  }
}
