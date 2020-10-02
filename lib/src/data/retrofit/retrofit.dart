import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shkabaj_flutter/src/models/video.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://www.shkabaj.net")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/mobi/common/video.json")
  Future<Video> getVideos();
}