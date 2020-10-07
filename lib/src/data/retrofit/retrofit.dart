import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';
import 'package:shkabaj_flutter/src/models/lidhje.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';
import 'package:shkabaj_flutter/src/models/radio.dart';
import 'package:shkabaj_flutter/src/models/tv.dart';
import 'package:shkabaj_flutter/src/models/video.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://www.shkabaj.net")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/mobi/common/video.json")
  Future<Video> getVideos();

  @GET("/mobi/common/ballina-lidhje.json")
  Future<Lidhje> getLidhje();

  @GET("/mobi/common/tv-android.json")
  Future<Tv> getTv();

  @GET("/mobi/android/radio/stats/radios.php")
  Future<Radio> getRadios();

  @GET("/moti/wwo.php?a=city&c=Skopje%2C+Karpos%2C+Macedonia")
  Future<String> getShkMoti();

  @GET("/moti/wwo.php?a=city&c=Pristina%2C+Kosovo")
  Future<String> getPrMoti();

  @GET("/moti/wwo.php?a=city&c=Tirana%2C+Al")
  Future<String> getTrMoti();
}