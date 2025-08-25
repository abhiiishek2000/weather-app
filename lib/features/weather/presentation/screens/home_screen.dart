import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/weather_cubit.dart';
import '../widget/five_day_forecast.dart';
import '../widget/weather_header_widget.dart';
import '../widget/hourly_weather_info.dart';
import '../widget/weather_card_widget.dart';
import '../widget/weather_details_widget.dart';

class MainWeatherScreen extends StatefulWidget {
  const MainWeatherScreen({super.key});

  @override
  State<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends State<MainWeatherScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WeatherCubit>(context).getCurrentWeatherData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: BlocConsumer<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Header info
                      WeatherHeaderWidget(
                        cityName:
                            "${state.currentWeather?.name}, ${state.currentWeather?.sys?.country}",
                        date: DateTime.now(),
                      ),
                      const SizedBox(height: 20),

                      // Main weather info
                      WeatherCardWidget(
                        weatherId: state.currentWeather?.weather.first.id,
                        weatherIcon: state.currentWeather?.weather.first.icon,
                        weatherMain: state.currentWeather?.weather.first.main,
                        weatherDescription:
                            state.currentWeather?.weather.first.description,
                        temperature: state.currentWeather?.main?.temp,
                        feelsLike: state.currentWeather?.main?.feelsLike,
                        minTemp: state.currentWeather?.main?.tempMin,
                        maxTemp: state.currentWeather?.main?.tempMax,
                      ),
                      const SizedBox(height: 24),

                      // Hourly Forecast
                      HourlyWeatherInfo(
                        hourlyForecast: state.forecast != null
                            ? state.forecast!.todayHourlyForecast
                            : [],
                        isLoading: state.isForecastLoading,
                      ),
                      const SizedBox(height: 24),

                      // 5-Day Forecast
                      FiveDayForecast(
                        fiveDaysForeCast: state.forecast?.fiveDaysForecast,
                      ),
                      const SizedBox(height: 24),

                      // Weather Details
                      WeatherDetailsWidget(
                        humidity:
                            state.currentWeather?.main?.humidity.toString() ??
                            '',
                        windSpeed:
                            state.currentWeather?.wind?.speed.toString() ?? '',

                        pressure:
                            state.currentWeather?.main?.pressure.toString() ??
                            '',
                      ),
                    ],
                  ),
                );
              } else if (state is WeatherError) {
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
            listener: (context, state) {
              if (state is WeatherError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is WeatherLoaded) {
                BlocProvider.of<WeatherCubit>(context).getForecastData();
              }
            },
          ),
        ),
      ),
    );
  }
}
