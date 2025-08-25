import 'package:flutter/material.dart';
import '../../../../core/utils/app_date_formatter.dart';
import '../../../../core/utils/weather_icon_wrapper.dart';
import '../../domain/entities/forecast_entity.dart';

class FiveDayForecast extends StatelessWidget {
  final List<FiveDaysForecastEntity>? fiveDaysForeCast;

  const FiveDayForecast({super.key, required this.fiveDaysForeCast});

  @override
  Widget build(BuildContext context) {
    if (fiveDaysForeCast == null) {
      return SizedBox.shrink();
    }
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5-Day Forecast',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...fiveDaysForeCast!.map(
              (data) => _buildItem(
                context,
                AppDateFormatter.formatDay(data.dtTxt!),
                data.icon!,
                '${data.tempMax!.round()}°',
                '${data.tempMin!.round()}°',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String day,
    String icon,
    String high,
    String low,
  ) {
    final iconUrl = WeatherIconMapper.getWeatherIconUrl(icon);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              day,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
          const Spacer(),
          Image.network(
            iconUrl,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.wb_sunny, size: 20, color: Colors.amber);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: 20,
                height: 20,
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

          const SizedBox(width: 20),
          Text(
            low,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white60),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 40,
            child: Text(
              high,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
