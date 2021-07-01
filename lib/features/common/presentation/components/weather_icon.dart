import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
    this.iconId, {
    Key? key,
    this.size = 80,
  }) : super(key: key);

  final String iconId;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      fit: BoxFit.fill,
      imageUrl: 'http://openweathermap.org/img/w/$iconId.png',
    );
  }
}
