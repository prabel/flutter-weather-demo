import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/features/common/presentation/components/progress_view.dart';
import 'package:weeath_app_demo/features/search/presentation/bloc/search_location_weather_bloc.dart';
import 'package:weeath_app_demo/features/weather/data/models/current_weather_response.dart';
import 'package:weeath_app_demo/features/weather/presentation/components/current_weather_view.dart';
import 'package:weeath_app_demo/core/extensions/string_extensions.dart';

class SearchLocationPage extends StatelessWidget {
  const SearchLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchLocationWeatherBloc.fromContext(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _SearchLocationField(),
              const SizedBox(height: 32),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocBuilder<SearchLocationWeatherBloc, SearchLocationWeatherState>(
          builder: (
            BuildContext context,
            SearchLocationWeatherState state,
          ) {
            return state.maybeWhen(
              initial: () => _buildSearchHint(context),
              orElse: () => const SizedBox.shrink(),
              loading: () => const ProgressView(),
              weather: (CurrentWeatherResponse weather) => CurrentWeatherView(weather),
            );
          },
        );
      },
    );
  }

  Widget _buildSearchHint(BuildContext context) {
    return Column(
      children: [
        Text(
          'Search engine is very flexible. How it works:',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 16),
        Text(
          'To make it more precise put the city\'s name, comma, 2-letter country code (ISO3166). You will get all proper cities in chosen country.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 8),
        Text(
          'The order is important - the first is city name then comma then country. Example - London, GB or New York, US.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class _SearchLocationField extends StatefulWidget {
  @override
  _SearchLocationFieldState createState() => _SearchLocationFieldState();
}

class _SearchLocationFieldState extends State<_SearchLocationField> {
  final TextEditingController _textEditingController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchLocationWeatherBloc, SearchLocationWeatherState>(
      listener: (BuildContext context, SearchLocationWeatherState state) {
        state.maybeWhen(
          failed: (Failure failure) {
            setState(() {
              _errorMessage = 'Not Found (${failure.getMessage().capitalize()})';
            });
          },
          weather: (_) {
            setState(() {
              _errorMessage = null;
            });
          },
          orElse: () {},
        );
      },
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Weather in your city',
          errorText: _errorMessage,
          suffixIcon: _buildSuffixIcon(),
        ),
        onChanged: (String query) {
          context.read<SearchLocationWeatherBloc>().search(query);
        },
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        _textEditingController.clear();
        context.read<SearchLocationWeatherBloc>().reset();
      },
      icon: const Icon(Icons.clear),
    );
  }
}
