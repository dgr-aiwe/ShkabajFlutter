import 'package:json_annotation/json_annotation.dart';

part 'lidhje.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Lidhje {
  final List<AlbanianLinks> albanianLinks;

  Lidhje({this.albanianLinks});

  factory Lidhje.fromJson(Map<String, dynamic> json) => _$LidhjeFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class LidhjeItem {
  final String name;
  final String id;
  final String logo;
  final String url;

  LidhjeItem({this.logo, this.name, this.id, this.url});

  factory LidhjeItem.fromJson(Map<String, dynamic> json) => _$LidhjeItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class AlbanianLinks {
  final List<LidhjeItem> sourceList;

  AlbanianLinks({this.sourceList});

  factory AlbanianLinks.fromJson(Map<String, dynamic> json) => _$AlbanianLinksFromJson(json);
}