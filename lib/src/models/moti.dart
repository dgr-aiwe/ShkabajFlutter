
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Moti {
  final MotiData motiData;
  City city;

  Moti(this.motiData, {this.city});
}

@JsonSerializable()
class MotiData {
  final Weather data;

  MotiData(this.data);
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
}

enum City {
  Pr,
  Tir,
  Shk
}