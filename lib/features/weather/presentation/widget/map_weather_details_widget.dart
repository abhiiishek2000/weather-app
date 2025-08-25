import 'package:flutter/material.dart';

import '../../domain/entities/weather_entity.dart';

class MapWeatherDetailsWidget extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const MapWeatherDetailsWidget({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Stack(
            children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
            Center(
              child: Text('Weather Details', style: Theme
              .of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
            ),
    const SizedBox(height: 16),
    Text(
    '${weatherEntity.name}, ${weatherEntity.sys?.country}',
    style: Theme.of(
    context,
    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    Text(
    'Temperature: ${weatherEntity.main?.temp}°C',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Feels Like: ${weatherEntity.main?.feelsLike}°C',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Min Temp: ${weatherEntity.main?.tempMin}°C',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Max Temp: ${weatherEntity.main?.tempMax}°C',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Description: ${weatherEntity.weather.first.description}',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Humidity: ${weatherEntity.main?.humidity}%',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Wind Speed: ${weatherEntity.wind?.speed} m/s',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 8),
    Text(
    'Pressure: ${weatherEntity.main?.pressure} hPa',
    style: Theme.of(context).textTheme.bodyMedium,
    ),
    const SizedBox(height: 16),
    ],
    ),
    Align(
    alignment: Alignment.topRight,
    child: IconButton(
    onPressed: () => Navigator.pop(context),
    icon: const Icon(Icons.close),
    ),
    ),
    ],
    )
    ,
    );
  }
}
