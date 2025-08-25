import 'package:flutter/material.dart';
import '../../../../core/utils/weather_icon_wrapper.dart';

class WeatherCardWidget extends StatelessWidget {
  final int? weatherId;
  final String? weatherIcon;
  final String? weatherMain;
  final String? weatherDescription;
  final double? temperature;
  final double? feelsLike;
  final double? minTemp;
  final double? maxTemp;

  const WeatherCardWidget({
    super.key,
    this.weatherId,
    this.weatherIcon,
    this.weatherMain,
    this.weatherDescription,
    this.temperature,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    final iconUrl = WeatherIconMapper.getWeatherIconUrl(weatherIcon);

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Image.network(
                iconUrl,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if image fails to load
                  return const Icon(
                    Icons.wb_sunny,
                    size: 80,
                    color: Colors.amber,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Temperature
            Text(
              '${temperature?.round() ?? 0}°',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            // Weather condition
            Text(
              _capitalizeWords(weatherDescription ?? 'Unknown'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            // Feels like
            Text(
              'Feels like ${feelsLike?.round() ?? 0}°',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              ),
            ),
            const SizedBox(height: 16),

            // Min/Max temperatures
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTempInfo(context,'Min', '${minTemp?.round() ?? 0}°', Icons.thermostat),
                _buildTempInfo(context,'Max', '${maxTemp?.round() ?? 0}°', Icons.thermostat),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTempInfo(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _capitalizeWords(String text) {
    return text.split(' ').map((word) =>
    word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word
    ).join(' ');
  }
}
