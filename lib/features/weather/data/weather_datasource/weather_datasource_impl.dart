import 'package:weather_app/core/credientials/api_creds.dart';
import 'package:weather_app/core/networking/api_provider.dart';
import 'package:weather_app/features/weather/data/weather_datasource/weather_datasource.dart';

import '../models/forecast_model.dart';
import '../models/weather_model.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  final ApiProvider _apiProvider;

  WeatherDataSourceImpl({required ApiProvider apiProvider})
    : _apiProvider = apiProvider;

  @override
  Future<ForecastModel> getForecastByLatLong(double lat, double long) async {
    Map<String, String> data = {
      'lat': lat.toString(),
      'lon': long.toString(),
      'appid': weatherApiKey,
      'units': 'metric',
    };
    print(data);
    var response = await _apiProvider.get('forecast', data);

    return ForecastModel.fromJson(response);
  }

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    Map<String, String> data = {
      'q': cityName,
      'appid': weatherApiKey,
      'units': 'metric',
    };
    var response = await _apiProvider.get('weather', data);
    return WeatherModel.fromJson(response);
  }

  @override
  Future<WeatherModel> getWeatherByLatLong(double lat, double long) async {
    Map<String, String> data = {
      'lat': lat.toString(),
      'lon': long.toString(),
      'appid': weatherApiKey,
      'units': 'metric',
    };
    var response = await _apiProvider.get('weather', data);
    return WeatherModel.fromJson(response);
  }
}
