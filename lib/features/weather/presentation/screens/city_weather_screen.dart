import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/city_weather_cubit.dart';
import '../widget/weather_header_widget.dart';
import '../widget/weather_card_widget.dart';
import '../widget/weather_details_widget.dart';

class CityWeatherScreen extends StatefulWidget {
  final String cityName;

  const CityWeatherScreen({super.key, required this.cityName});

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CityWeatherCubit>(
        context,
      ).getCityWeatherData(widget.cityName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: SafeArea(
        child: BlocBuilder<CityWeatherCubit, CityWeatherState>(
          builder: (context, state) {
            if (state is CityWeatherLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header info
                    WeatherHeaderWidget(
                      cityName:
                          "${state.weather.name}, ${state.weather.sys?.country}",
                      isBackEnabled: true,
                      date: DateTime.now(),
                    ),
                    const SizedBox(height: 20),

                    // Main weather info
                    WeatherCardWidget(
                      weatherId: state.weather.weather.first.id,
                      weatherIcon: state.weather.weather.first.icon,
                      weatherMain: state.weather.weather.first.main,
                      weatherDescription:
                          state.weather.weather.first.description,
                      temperature: state.weather.main?.temp,
                      feelsLike: state.weather.main?.feelsLike,
                      minTemp: state.weather.main?.tempMin,
                      maxTemp: state.weather.main?.tempMax,
                    ),
                    const SizedBox(height: 24),

                    // Weather Details
                    WeatherDetailsWidget(
                      humidity:
                          state.weather.main?.humidity.toString() ?? '',
                      windSpeed:
                          state.weather.wind?.speed.toString() ?? '',

                      pressure:
                          state.weather.main?.pressure.toString() ?? '',
                    ),
                  ],
                ),
              );
            } else if (state is CityWeatherError) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
