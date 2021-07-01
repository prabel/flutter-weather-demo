import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/common/presentation/components/failure_view.dart';
import 'package:weeath_app_demo/features/common/presentation/components/progress_view.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';
import 'package:weeath_app_demo/features/weather/presentation/bloc/forecast/forecast_bloc.dart';
import 'package:weeath_app_demo/features/weather/presentation/components/forecast_daily_item.dart';

class ForecastPageArgument {
  ForecastPageArgument({this.numberOfDays = 16, required this.location});

  final int numberOfDays;
  final String location;
}

class ForecastPage extends StatelessWidget {
  const ForecastPage({
    Key? key,
    required this.numberOfDays,
    required this.location,
  }) : super(key: key);

  final int numberOfDays;
  final String location;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ForecastBloc.fromContext(context)..load(location);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$numberOfDays-days forecast for $location',
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (BuildContext context, ForecastState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          forecast: (DailyForecastResponse forecastData) => _builderForecastDetails(
            context,
            forecastData,
          ),
          failed: (Failure failure) => Center(
            child: FailureView(
              failure: failure,
            ),
          ),
        );
      },
    );
  }

  Widget _builderForecastDetails(
    BuildContext context,
    DailyForecastResponse forecastData,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) {
        return ForecastDailyItem(forecastData.list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
      itemCount: forecastData.list.length,
    );
  }
}
