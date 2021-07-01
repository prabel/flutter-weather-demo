import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeath_app_demo/core/theme/theme.dart';
import 'package:weeath_app_demo/features/location/domain/repositories/location_repository.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

class SimpleTestWrapper extends StatelessWidget {
  const SimpleTestWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: getAppTheme(context),
        child: child,
      ),
    );
  }
}

class MockedDataTestWrapper extends StatelessWidget {
  const MockedDataTestWrapper({
    Key? key,
    required this.child,
    required this.weatherRepository,
    required this.locationRepository,
  }) : super(key: key);

  final Widget child;
  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (BuildContext context) => weatherRepository,
        ),
        RepositoryProvider<LocationRepository>(
          create: (BuildContext context) => locationRepository,
        ),
      ],
      child: MaterialApp(
        theme: getAppTheme(context),
        debugShowCheckedModeBanner: false,
        home: Material(child: child),
      ),
    );
  }
}
