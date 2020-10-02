import 'package:dio/dio.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/data/retrofit/retrofit.dart';

class Repository {
  static const String TV_SCREEN_URL = "https://www.shkabaj.net/mobi/common/tv-android.json";

  void loadData() {
    Dio dio = Dio();
    final client = ApiClient(dio);

    client.getVideos().then((value) =>
        ballinaBloc.setVideos(value.popularChannels[0].popularChannelList));

    client.getLidhje().then((value) =>
      ballinaBloc.setLidhje(value.albanianLinks[0].sourceList));
  }
}