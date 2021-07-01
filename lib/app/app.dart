import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeath_app_demo/app/environment_config.dart';
import 'package:weeath_app_demo/core/data/api/api_client.dart';
import 'package:weeath_app_demo/core/theme/theme.dart';
import 'package:weeath_app_demo/features/location/data/repositories/location_repository_impl.dart';
import 'package:weeath_app_demo/features/location/domain/repositories/location_repository.dart';
import 'package:weeath_app_demo/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weeath_app_demo/features/weather/domain/repositories/weather_repository.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (BuildContext context) => WeatherRepositoryImpl(
            ApiClient(EnvironmentConfig.host),
            appId: EnvironmentConfig.weather_api_key,
          ),
        ),
        RepositoryProvider<LocationRepository>(
          create: (BuildContext context) => LocationRepositoryImpl(),
        )
      ],
      child: MaterialApp(
        title: appName,
        theme: getAppTheme(context),
        darkTheme: getAppTheme(context),
        initialRoute: '/',
        onGenerateRoute: (settings) => router(settings),
      ),
    );
  }
}
