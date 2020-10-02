import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable()
class Tv {
  final List<TvList> tv;

  Tv(this.tv);
  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class TvList {
  final List<TvItem> tvList;

  TvList(this.tvList);
  factory TvList.fromJson(Map<String, dynamic> json) => _$TvListFromJson(json);

}

@JsonSerializable()
class TvItem {
  final String name;
  final String location;
  final String id;
  final String logo;
  final String url;

  TvItem(this.name, this.location, this.id, this.logo, this.url);
  factory TvItem.fromJson(Map<String, dynamic> json) => _$TvItemFromJson(json);

}