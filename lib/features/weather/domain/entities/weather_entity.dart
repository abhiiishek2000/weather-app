import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final CoordEntity? coord;
  final List<WeatherInfoEntity> weather;
  final String? base;
  final MainEntity? main;
  final int? visibility;
  final WindEntity? wind;
  final CloudsEntity? clouds;
  final int? dt;
  final SysEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  @override
  List<Object?> get props => [
    coord,
    weather,
    base,
    main,
    visibility,
    wind,
    clouds,
    dt,
    sys,
    timezone,
    id,
    name,
    cod,
  ];
}

class CloudsEntity extends Equatable {
  const CloudsEntity({
    required this.all,
  });

  final int? all;

  @override
  List<Object?> get props => [all];
}

class CoordEntity extends Equatable {
  const CoordEntity({
    required this.lon,
    required this.lat,
  });

  final double? lon;
  final double? lat;

  @override
  List<Object?> get props => [lon, lat];
}

class MainEntity extends Equatable {
  const MainEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  @override
  List<Object?> get props => [
    temp,
    feelsLike,
    tempMin,
    tempMax,
    pressure,
    humidity,
    seaLevel,
    grndLevel,
  ];
}

class SysEntity extends Equatable {
  const SysEntity({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final String? country;
  final int? sunrise;
  final int? sunset;

  @override
  List<Object?> get props => [country, sunrise, sunset];
}

class WeatherInfoEntity extends Equatable {
  const WeatherInfoEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => [id, main, description, icon];
}

class WindEntity extends Equatable {
  const WindEntity({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double? speed;
  final int? deg;
  final double? gust;

  @override
  List<Object?> get props => [speed, deg, gust];
}
