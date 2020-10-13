import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/data/retrofit/retrofit.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';
import 'package:shkabaj_flutter/src/models/news.dart';
import 'package:shkabaj_flutter/src/models/resource.dart';
import 'package:xml/xml.dart';

class Repository {

  void loadData() {
    Dio dio = setupDio();
    final client = ApiClient(dio);

    loadVideos(client);
    loadLidhje(client);
    loadTv(client);
    loadNews(dio);
    loadRadios(client);
    loadDailyVideos(dio);
    loadMoti(client);
  }

  void loadRadios(ApiClient client) {
    client.getRadios().then((value) async =>
      ballinaBloc.setRadios(Resource(isLoaded: true, data: value.radios)),
    onError: (error) {
      ballinaBloc.setRadios(Resource(isLoaded: false, data: null));
    });
  }

  void loadTv(ApiClient client) {
    client.getTv().then(
        (value) async => ballinaBloc
            .setTv(Resource(isLoaded: true, data: value.tv[0].tvList)),
        onError: (error) {
      ballinaBloc.setTv(Resource(isLoaded: false, data: null));
    });
  }

  void loadLidhje(ApiClient client) {
    client.getLidhje().then((value) async =>
      ballinaBloc.setLidhje(Resource(isLoaded: true, data: value.albanianLinks[0].sourceList)),
    onError: (error) {
      ballinaBloc.setLidhje(Resource(isLoaded: false, data: null));
    });
  }

  void loadVideos(ApiClient client) {
    client.getVideos().then((value) async =>
        ballinaBloc.setVideos(Resource(isLoaded: true, data: value.popularChannels[0].popularChannelList)),
    onError: (error) {
      ballinaBloc.setVideos(Resource(isLoaded: false, data: null));
    });
  }

  void loadDailyVideos(Dio dio) {
    dio.post("https://www.shkabaj.net/mobi/common/video-caching/cached-files/PLmJUxMrdr6xCZpmpsWwDOO5KMEgAQIT43.txt")
        .then((value) async => ballinaBloc.setDailyVideos(
          Resource(isLoaded: true, data: DailyVideo.fromJson(json.decode(value.data)).items)),
        onError: (error) {
          ballinaBloc.setDailyVideos(Resource(isLoaded: false, data: null));
    });
  }

  void loadNews(Dio dio) {
    dio.post("https://www.shkabaj.net/news/updates/shkabaj.xml").then((value) async {
      XmlDocument document = XmlDocument.parse(value.data as String);
      List<XmlElement> titles = document.findAllElements("title").toList();
      List<XmlElement> images = document.findAllElements("imageURI").toList();
      List<New> news = List();
    
      for (int i = 0; i < titles.length; i++) {
        news.add(New(title: titles[i].text, logo: images[i].text));
      }
      
      ballinaBloc.setNews(Resource(isLoaded: true, data: news));
    },
        
    onError: (error) {
      ballinaBloc.setNews(Resource(isLoaded: false, data: null));
    });
  }

  Dio setupDio() {
    Dio dio = Dio();
    
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        return "PROXY 192.168.1.60:8888";
      };
    
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    return dio;
  }

  void loadMoti(client) async {
    Map<City, Moti> map = Map();

    try {
      await client.getShkMoti().then((value) => map[City.Shk] = Moti.fromJson(json.decode(value)));
      await client.getPrMoti().then((value) =>  map[City.Pr] = Moti.fromJson(json.decode(value)));
      await client.getTrMoti().then((value) => map[City.Tir] = Moti.fromJson(json.decode(value)));
    }
    catch (e) {
      ballinaBloc.setMoti(Resource(isLoaded: false, data: null));
    }


    if (map.length == 3) {
      ballinaBloc.setMoti(Resource(isLoaded: true, data: map));
    }
    else {
      ballinaBloc.setMoti(Resource(isLoaded: false, data: null));
    }
  }
}