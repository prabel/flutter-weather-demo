import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/common/presentation/components/failure_view.dart';
import 'package:weeath_app_demo/features/common/presentation/components/progress_view.dart';
import 'package:weeath_app_demo/features/location/presentation/bloc/current_location_bloc.dart';
import 'package:weeath_app_demo/features/weather/presentation/components/position_weather.dart';

class CurrentLocationContainer extends StatelessWidget {
  const CurrentLocationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CurrentLocationBloc.fromContext(context)..loadUserLocation(),
      child: Builder(
        builder: (BuildContext context) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<CurrentLocationBloc, CurrentLocationState>(
      builder: (BuildContext context, CurrentLocationState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          userLocation: (Position position) => _buildUserLocation(
            context,
            position,
          ),
          failed: (Failure failure) => Center(child: FailureView(failure: failure)),
        );
      },
    );
  }

  Widget _buildUserLocation(BuildContext context, Position position) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current location:',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          PositionWeather(position: position),
        ],
      ),
    );
  }
}
