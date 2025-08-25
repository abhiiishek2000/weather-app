import 'package:flutter/material.dart';
import '../../../../core/utils/app_date_formatter.dart';
import '../../../../core/utils/weather_icon_wrapper.dart';
import '../../domain/entities/forecast_entity.dart';

class HourlyWeatherInfo extends StatelessWidget {
  final List<ForecastItemEntity> hourlyForecast;
  final bool isLoading;

  const HourlyWeatherInfo({
    super.key,
    required this.hourlyForecast,
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'Hourly Forecast',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyForecast.length,
                  itemBuilder: (context, index) {
                    final data = hourlyForecast[index];
                    final iconUrl = WeatherIconMapper.getWeatherIconUrl(
                      data.weather.first.icon,
                    );
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppDateFormatter.formatTimeShort(data.dtTxt!),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.white70),
                          ),
                          Image.network(
                            iconUrl,
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.wb_sunny,
                                size: 80,
                                color: Colors.amber,
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return SizedBox(
                                width: 24,
                                height: 24,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value:
                                        loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                        : null,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                          Text(
                            '${data.main!.temp!.round()}°',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
