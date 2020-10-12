import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/data/retrofit/retrofit.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';
import 'package:shkabaj_flutter/src/models/news.dart';
import 'package:xml/xml.dart';

class Repository {

  void loadData() {
    Dio dio = Dio();
    final client = ApiClient(dio);

    client.getVideos().then((value) async =>
        ballinaBloc.setVideos(value.popularChannels[0].popularChannelList));

    client.getLidhje().then((value) async =>
      ballinaBloc.setLidhje(value.albanianLinks[0].sourceList));

    client.getTv().then((value) async =>
      ballinaBloc.setTv(value.tv[0].tvList));

    dio.post("https://www.shkabaj.net/news/updates/shkabaj.xml").then((value) async {
      XmlDocument document = XmlDocument.parse(value.data as String);
      List<XmlElement> titles = document.findAllElements("title").toList();
      List<XmlElement> images = document.findAllElements("imageURI").toList();
      List<New> news = List();

      for (int i = 0; i < titles.length; i++) {
        news.add(New(title: titles[i].text, logo: images[i].text));
      }
      ballinaBloc.setNews(news);
    });

    client.getRadios().then((value) async =>
      ballinaBloc.setRadios(value.radios));

    dio.post("https://www.shkabaj.net/mobi/common/video-caching/cached-files/PLmJUxMrdr6xCZpmpsWwDOO5KMEgAQIT43.txt")
        .then((value) async =>
        ballinaBloc.setDailyVideos(DailyVideo.fromJson(json.decode(value.data)).items));
  }

  void loadMoti() async {
    Dio dio = Dio();
    final client = ApiClient(dio);

    Map<City, Moti> map = Map();
    await client.getShkMoti().then((value) => map[City.Shk] = Moti.fromJson(json.decode(value)));
    await client.getPrMoti().then((value) => map[City.Pr] = Moti.fromJson(json.decode(value)));
    await client.getTrMoti().then((value) => map[City.Tir] = Moti.fromJson(json.decode(value)));
    ballinaBloc.setMoti(map);
  }
}