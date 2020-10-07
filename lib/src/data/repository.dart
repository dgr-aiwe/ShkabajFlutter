import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/data/retrofit/retrofit.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';

class Repository {

  void loadData() {
    Dio dio = Dio();
    final client = ApiClient(dio);

    client.getVideos().then((value) =>
        ballinaBloc.setVideos(value.popularChannels[0].popularChannelList));

    client.getLidhje().then((value) =>
      ballinaBloc.setLidhje(value.albanianLinks[0].sourceList));

    client.getTv().then((value) =>
      ballinaBloc.setTv(value.tv[0].tvList));

    client.getRadios().then((value) =>
      ballinaBloc.setRadios(value.radios));

    dio.post("https://www.shkabaj.net/mobi/common/video-caching/cached-files/PLmJUxMrdr6xCZpmpsWwDOO5KMEgAQIT43.txt")
        .then((value) =>
        ballinaBloc.setDailyVideos(DailyVideo.fromJson(json.decode(value.data)).items));

    client.getShkMoti().then((value) =>
        ballinaBloc.setMoti(Moti.fromJson(json.decode(value)), City.Shk));

    client.getPrMoti().then((value) =>
      ballinaBloc.setMoti(Moti.fromJson(json.decode(value)), City.Pr));

    client.getTrMoti().then((value) =>
        ballinaBloc.setMoti(Moti.fromJson(json.decode(value)), City.Tir));
  }
}