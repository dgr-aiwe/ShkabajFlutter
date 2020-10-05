import 'package:json_annotation/json_annotation.dart';

part 'radio.g.dart';

@JsonSerializable()
class Radio {
  final List<RadioItem> radios;

  Radio(this.radios);
  factory Radio.fromJson(Map<String, dynamic> json) => _$RadioFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RadioItem {
  final String name;
  final String city;
  final String imageName;

  RadioItem(this.name, this.city, this.imageName);
  factory RadioItem.fromJson(Map<String, dynamic> json) => _$RadioItemFromJson(json);
}