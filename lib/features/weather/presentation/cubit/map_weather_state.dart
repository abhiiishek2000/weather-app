import 'package:equatable/equatable.dart';
import '../../domain/entities/weather_entity.dart';

abstract class MapWeatherState extends Equatable {
  const MapWeatherState();
}

class MapWeatherInitial extends MapWeatherState {
  @override
  List<Object?> get props => [];
}

class MapWeatherLoading extends MapWeatherState {
  @override
  List<Object?> get props => [];
}

class MapWeatherDataLoaded extends MapWeatherState {
  final WeatherEntity data;

  const MapWeatherDataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class MapWeatherDataError extends MapWeatherState {
  final String message;

  const MapWeatherDataError({required this.message});

  @override
  List<Object?> get props => [message];
}
