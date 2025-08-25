import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

class ForecastEntity extends Equatable {
  const ForecastEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastItemEntity> list;
  final CityEntity? city;

  List<ForecastItemEntity> get todayHourlyForecast {
    final DateTime now = DateTime.now();

    return list.where((element) {
      final itemDateTime = element.dtTxt;
      if (itemDateTime == null) return false;

      return itemDateTime.year == now.year &&
          itemDateTime.month == now.month &&
          itemDateTime.day == now.day;
    }).toList();
  }
  List<FiveDaysForecastEntity> get fiveDaysForecast {
    final DateTime now = DateTime.now();
    final Map<DateTime, FiveDaysForecastEntity> forecastMap = {};
    for (final item in list) {
      final itemDateTime = item.dtTxt;
      if (itemDateTime == null) continue;
      final date = DateTime(
        itemDateTime.year,
        itemDateTime.month,
        itemDateTime.day,
      );
      if (date.isBefore(now)) continue;
      final existingForecast = forecastMap[date];
      if (existingForecast == null) {
        forecastMap[date] = FiveDaysForecastEntity(
            tempMin: item.main?.tempMin,
            tempMax: item.main?.tempMax,
            dtTxt: item.dtTxt,
            condition: item.weather.first.main,
            icon: item.weather.first.icon);
      }
    }
    return forecastMap.values.toList();
  }
  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}

class CityEntity extends Equatable {
  const CityEntity({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  final int? id;
  final String? name;
  final CoordEntity? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  @override
  List<Object?> get props => [
    id,
    name,
    coord,
    country,
    population,
    timezone,
    sunrise,
    sunset,
  ];
}

class ForecastItemEntity extends Equatable {
  const ForecastItemEntity({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });

  final int? dt;
  final ForecastMainEntity? main;
  final List<WeatherInfoEntity> weather;
  final CloudsEntity? clouds;
  final WindEntity? wind;
  final int? visibility;
  final double? pop;
  final ForecastSysEntity? sys;
  final DateTime? dtTxt;
  final RainEntity? rain;

  @override
  List<Object?> get props => [
    dt,
    main,
    weather,
    clouds,
    wind,
    visibility,
    pop,
    sys,
    dtTxt,
    rain,
  ];
}

class ForecastMainEntity extends Equatable {
  const ForecastMainEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  @override
  List<Object?> get props => [
    temp,
    feelsLike,
    tempMin,
    tempMax,
    pressure,
    seaLevel,
    grndLevel,
    humidity,
    tempKf,
  ];
}

class RainEntity extends Equatable {
  const RainEntity({required this.threeHour});

  final double? threeHour;

  @override
  List<Object?> get props => [threeHour];
}

class ForecastSysEntity extends Equatable {
  const ForecastSysEntity({required this.pod});

  final String? pod; // Different from weather Sys (only has pod)

  @override
  List<Object?> get props => [pod];
}

class FiveDaysForecastEntity extends Equatable {
  final double? tempMin;
  final double? tempMax;
  final DateTime? dtTxt;
  final String? icon;
  final String? condition;

  const FiveDaysForecastEntity({
    required this.tempMin,
    required this.tempMax,
    required this.dtTxt,
    required this.icon,
    required this.condition,
  });

  @override
  List<Object?> get props => [tempMin, tempMax, dtTxt, icon,condition];
}
