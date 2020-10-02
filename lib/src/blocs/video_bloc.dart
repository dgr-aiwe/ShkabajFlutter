import 'package:rxdart/rxdart.dart';
import 'package:shkabaj_flutter/src/models/popular_channel_list.dart';

class VideoBloc {

  final _localSetter = PublishSubject<List<PopularChannelList>>();

  Observable<List<PopularChannelList>> get videos => _localSetter.stream;

  void setVideos(List<PopularChannelList> list) {
    _localSetter.sink.add(list);
  }

  void dispose() {
    _localSetter.close();
  }
}

VideoBloc videoBlock = VideoBloc();