import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/location_service.dart';

import '../core/networking/api_provider.dart';
import 'features/weather/weather_container_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final ApiProvider apiProvider = ApiProvider();
  final LocationService locationService = LocationService();
  sl.registerLazySingleton(() => apiProvider);
  sl.registerLazySingleton(() => locationService);
  await weatherContainerInjection();


}