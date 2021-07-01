import 'package:flutter/material.dart';
import 'package:weeath_app_demo/features/common/presentation/components/date_label.dart';
import 'package:weeath_app_demo/features/common/presentation/components/weather_icon.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast.dart';
import 'package:weeath_app_demo/core/extensions/string_extensions.dart';

class ForecastDailyItem extends StatelessWidget {
  const ForecastDailyItem(this.dailyForecast, {Key? key}) : super(key: key);

  final DailyForecast dailyForecast;

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateLabel(
            dateTime: dailyForecast.dt,
            textStyle: Theme.of(context).textTheme.headline6,
            dateFormat: 'EEEE, MMM dd',
          ),
          Text(
            '${dailyForecast.weather.first.description.capitalize()}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              WeatherIcon(
                dailyForecast.weather.first.icon,
                size: 40,
              ),
              const SizedBox(width: 12),
              Text(
                '${dailyForecast.temp.max.toStringAsFixed(0)}/${dailyForecast.temp.min.toStringAsFixed(0)}°C',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Humidity: ${dailyForecast.humidity ?? '-'}%',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Pressure: ${dailyForecast.pressure ?? '-'} hPa',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Wind speed: ${dailyForecast.speed ?? '-'} m/s',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
