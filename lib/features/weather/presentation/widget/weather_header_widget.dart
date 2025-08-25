import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weather_app/core/routes/app_routes_const.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final String cityName;
  final DateTime date;
  final bool isBackEnabled;

  const WeatherHeaderWidget({
    super.key,
    required this.cityName,
    required this.date,
    this.isBackEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isBackEnabled)
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          ),
        Column(
          crossAxisAlignment:isBackEnabled? CrossAxisAlignment.center: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(LucideIcons.mapPin, color: Colors.white70, size: 16),
                const SizedBox(width: 4),
                Text(
                  cityName,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                ),
              ],
            ),
            Text(
              'Today, ${date.day} ${_getMonthName(date.month)}',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white60),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => context.push(AppRoutes.searchCity),
              icon: const Icon(LucideIcons.search, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month];
  }
}
