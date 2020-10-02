import 'package:json_annotation/json_annotation.dart';

part 'popular_channel_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class PopularChannelList {
  final String name;
  final String id;
  final String type;
  final String source;
  final bool blocked;
  final String logo;

  PopularChannelList(this.name, this.id, this.type, this.source, this.blocked, this.logo);
  factory PopularChannelList.fromJson(Map<String, dynamic> json) => _$PopularChannelListFromJson(json);
}