import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weeath_app_demo/app/router.dart';
import 'package:weeath_app_demo/features/common/presentation/components/weather_icon.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/data/models/weather_information.dart';
import 'package:weeath_app_demo/core/extensions/string_extensions.dart';
import 'package:weeath_app_demo/features/weather/presentation/pages/forecast_page.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView(this.weather, {Key? key}) : super(key: key);

  final CurrentWeatherResponse weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildCardBody(context),
    );
  }

  Widget _buildCardBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateTimeLabel(context, weather.dt),
          _buildDateCityLabel(context, weather.name),
          _buildTemperatureInformation(context, weather),
        ],
      ),
    );
  }

  Widget _buildDateTimeLabel(BuildContext context, int dt) {
    return Text(
      DateFormat('dd/MM/yyyy, HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(dt * 1000),
      ),
      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black38),
    );
  }

  Widget _buildDateCityLabel(BuildContext context, String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget _buildTemperatureInformation(
    BuildContext context,
    CurrentWeatherResponse weather,
  ) {
    final WeatherInformation weatherInformation = weather.weather.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            WeatherIcon(
              weather.weather.first.icon,
              size: 60,
            ),
            const SizedBox(width: 12),
            Text(
              '${weather.main.temp?.toStringAsFixed(0)}°C',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                weatherInformation.description.capitalize(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            _buildSeeMoreButton(context)
          ],
        ),
      ],
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          Routes.kForecastPage,
          arguments: ForecastPageArgument(location: weather.name, numberOfDays: 16),
        );
      },
      child: const Text('See 16-days forecast'),
    );
  }
}
