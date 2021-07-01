import 'dart:convert';

import 'package:test/test.dart';
import 'package:weeath_app_demo/features/weather/data/models/daily_forecast_response.dart';

void main() {
  test('Validate DailyForecastResponse serialization', () async {
    final DailyForecastResponse dailyForecastResponse = DailyForecastResponse.fromJson(
      jsonDecode(_exampleResponse),
    );

    expect(dailyForecastResponse.city.name, 'Poznań');
    expect(dailyForecastResponse.list.length, 7);
    expect(dailyForecastResponse.list[0].temp.min, 16.19);
  });
}

const String _exampleResponse = '''
{
  "city": {
    "id": 3088171,
    "name": "Poznań",
    "coord": {
      "lon": 16.9299,
      "lat": 52.4069
    },
    "country": "PL",
    "population": 570352,
    "timezone": 7200
  },
  "cod": "200",
  "message": 0.0392277,
  "cnt": 7,
  "list": [
    {
      "dt": 1625047200,
      "sunrise": 1625020415,
      "sunset": 1625080682,
      "temp": {
        "day": 17.88,
        "min": 16.19,
        "max": 21.9,
        "night": 16.19,
        "eve": 21.84,
        "morn": 18.47
      },
      "feels_like": {
        "day": 18.15,
        "night": 16.32,
        "eve": 21.57,
        "morn": 18.46
      },
      "pressure": 1006,
      "humidity": 93,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "speed": 7.91,
      "deg": 230,
      "gust": 13.06,
      "clouds": 94,
      "pop": 0.91,
      "rain": 3.8
    },
    {
      "dt": 1625133600,
      "sunrise": 1625106856,
      "sunset": 1625167064,
      "temp": {
        "day": 19.72,
        "min": 14.25,
        "max": 21.36,
        "night": 14.34,
        "eve": 20.48,
        "morn": 14.89
      },
      "feels_like": {
        "day": 19.42,
        "night": 14.13,
        "eve": 20.18,
        "morn": 14.73
      },
      "pressure": 1010,
      "humidity": 64,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "speed": 6.21,
      "deg": 230,
      "gust": 10.53,
      "clouds": 90,
      "pop": 0.57,
      "rain": 0.32
    },
    {
      "dt": 1625220000,
      "sunrise": 1625193299,
      "sunset": 1625253442,
      "temp": {
        "day": 17.7,
        "min": 11.8,
        "max": 21.56,
        "night": 16.12,
        "eve": 21.56,
        "morn": 12.76
      },
      "feels_like": {
        "day": 17.48,
        "night": 15.75,
        "eve": 21.34,
        "morn": 12.44
      },
      "pressure": 1014,
      "humidity": 75,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "speed": 4.21,
      "deg": 250,
      "gust": 7.29,
      "clouds": 97,
      "pop": 0.36,
      "rain": 0.12
    },
    {
      "dt": 1625306400,
      "sunrise": 1625279745,
      "sunset": 1625339817,
      "temp": {
        "day": 21.66,
        "min": 13.49,
        "max": 24.5,
        "night": 17.7,
        "eve": 23.4,
        "morn": 13.49
      },
      "feels_like": {
        "day": 21.47,
        "night": 17.25,
        "eve": 23.1,
        "morn": 13.19
      },
      "pressure": 1013,
      "humidity": 61,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "speed": 3.93,
      "deg": 269,
      "gust": 4.84,
      "clouds": 12,
      "pop": 0.46,
      "rain": 1.14
    },
    {
      "dt": 1625392800,
      "sunrise": 1625366194,
      "sunset": 1625426189,
      "temp": {
        "day": 24.41,
        "min": 15.26,
        "max": 25.78,
        "night": 18.42,
        "eve": 23.67,
        "morn": 15.26
      },
      "feels_like": {
        "day": 24.16,
        "night": 18.28,
        "eve": 23.58,
        "morn": 14.8
      },
      "pressure": 1012,
      "humidity": 48,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "speed": 2.69,
      "deg": 139,
      "gust": 3.08,
      "clouds": 100,
      "pop": 0
    },
    {
      "dt": 1625479200,
      "sunrise": 1625452645,
      "sunset": 1625512558,
      "temp": {
        "day": 24.5,
        "min": 15.51,
        "max": 26.75,
        "night": 19.61,
        "eve": 26.63,
        "morn": 15.51
      },
      "feels_like": {
        "day": 24.18,
        "night": 19.48,
        "eve": 26.63,
        "morn": 15.21
      },
      "pressure": 1010,
      "humidity": 45,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "speed": 3.38,
      "deg": 75,
      "gust": 6.18,
      "clouds": 77,
      "pop": 0
    },
    {
      "dt": 1625565600,
      "sunrise": 1625539099,
      "sunset": 1625598923,
      "temp": {
        "day": 17.67,
        "min": 17.21,
        "max": 22.1,
        "night": 17.22,
        "eve": 22.1,
        "morn": 17.21
      },
      "feels_like": {
        "day": 17.89,
        "night": 17.11,
        "eve": 22.04,
        "morn": 17.21
      },
      "pressure": 1011,
      "humidity": 92,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "speed": 5.06,
      "deg": 266,
      "gust": 8.16,
      "clouds": 100,
      "pop": 0.98,
      "rain": 4.47
    }
  ]
}
  ''';
