import 'package:json_annotation/json_annotation.dart';
import 'package:shkabaj_flutter/src/models/popular_channel_list.dart';

part 'popular_channel.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class PopularChannel {
  final List<PopularChannelList> popularChannelList;

  PopularChannel(this.popularChannelList);
  factory PopularChannel.fromJson(Map<String, dynamic> json) => _$PopularChannelFromJson(json);
}