import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Video {
  List<PopularChannel> popularChannels;

  Video(this.popularChannels);
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class PopularChannel {
  final List<PopularChannelList> popularChannelList;

  PopularChannel(this.popularChannelList);
  factory PopularChannel.fromJson(Map<String, dynamic> json) => _$PopularChannelFromJson(json);
}

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