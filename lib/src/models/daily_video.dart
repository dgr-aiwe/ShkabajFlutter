
import 'package:json_annotation/json_annotation.dart';

part 'daily_video.g.dart';

@JsonSerializable()
class DailyVideo {
  final List<DailyVideoItem> items;

  DailyVideo(this.items);
  factory DailyVideo.fromJson(Map<String, dynamic> json) => _$DailyVideoFromJson(json);
}

@JsonSerializable()
class DailyVideoItem {
  final ItemSnippet snippet;
  final ContentDetail contentDetails;

  DailyVideoItem(this.snippet, this.contentDetails);
  factory DailyVideoItem.fromJson(Map<String, dynamic> json) => _$DailyVideoItemFromJson(json);
}

@JsonSerializable()
class ItemSnippet {
  final String title;
  final Logos thumbnails;

  ItemSnippet(this.title, this.thumbnails);
  factory ItemSnippet.fromJson(Map<String, dynamic> json) => _$ItemSnippetFromJson(json);
}

@JsonSerializable()
class ContentDetail {
  final String duration;

  ContentDetail(this.duration);
  factory ContentDetail.fromJson(Map<String, dynamic> json) => _$ContentDetailFromJson(json);
}

@JsonSerializable()
class Logos {
  final DailyLogo medium;

  Logos(this.medium);
  factory Logos.fromJson(Map<String, dynamic> json) => _$LogosFromJson(json);
}

@JsonSerializable()
class DailyLogo {
  final String url;

  DailyLogo(this.url);
  factory DailyLogo.fromJson(Map<String, dynamic> json) => _$DailyLogoFromJson(json);
}