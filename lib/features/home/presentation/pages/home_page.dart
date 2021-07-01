import 'package:flutter/material.dart';
import 'package:weeath_app_demo/app/router.dart';
import 'package:weeath_app_demo/features/location/presentation/components/current_location_container.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          const CurrentLocationContainer(),
          const SizedBox(height: 16),
          _buildSearchButton(context),
        ],
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Search for different location'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kSearchPage);
      },
    );
  }
}
