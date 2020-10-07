
import 'package:json_annotation/json_annotation.dart';

part 'moti.g.dart';

@JsonSerializable()
class Moti {
  final MotiData data;
  City city;

  Moti(this.data, {this.city});
  factory Moti.fromJson(Map<String, dynamic> json) => _$MotiFromJson(json);
}

@JsonSerializable()
class MotiData {
  final Weather currentConditions;

  MotiData(this.currentConditions);
  factory MotiData.fromJson(Map<String, dynamic> json) => _$MotiDataFromJson(json);
}


@JsonSerializable()
class Weather {
  final String humidity;
  final String visibility;
  final String pressure;
  final String cloudcover;
  final String FeelsLikeC;
  final String temperature;
  final String windDirection;
  final String windSpeed;
  final String sunset;
  final String sunrise;
  final String chanceofrain;
  final String iconUrlExt;

  Weather(this.humidity, this.visibility, this.pressure, this.cloudcover,
      this.FeelsLikeC, this.temperature, this.windDirection, this.windSpeed,
      this.sunset, this.sunrise, this.chanceofrain, this.iconUrlExt);

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

enum City {
  Pr,
  Tir,
  Shk
}