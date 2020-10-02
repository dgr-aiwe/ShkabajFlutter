import 'package:json_annotation/json_annotation.dart';
import 'package:shkabaj_flutter/src/models/popular_channel.dart';

part 'video.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Video {
  List<PopularChannel> popularChannels;

  Video(this.popularChannels);
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}