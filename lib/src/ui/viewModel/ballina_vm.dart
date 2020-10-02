import 'package:dio/dio.dart';
import 'package:shkabaj_flutter/src/blocs/video_bloc.dart';
import 'package:shkabaj_flutter/src/data/retrofit/retrofit.dart';

class BallinaViewModel {
  void loadData() {
    Dio dio = Dio();
    final client = ApiClient(dio);

    client.getVideos().then((value) =>
    videoBlock.setVideos(value.popularChannels[0].popularChannelList));
  }
}