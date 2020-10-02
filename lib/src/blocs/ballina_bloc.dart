import 'package:rxdart/rxdart.dart';
import 'package:shkabaj_flutter/src/models/lidhje.dart';
import 'package:shkabaj_flutter/src/models/popular_channel_list.dart';

class BallinaBloc {

  final _videoSetter = PublishSubject<List<PopularChannelList>>();
  final _lidhjeSetter = PublishSubject<List<LidhjeItem>>();

  Observable<List<PopularChannelList>> get videos => _videoSetter.stream;
  Observable<List<LidhjeItem>> get lidhje => _lidhjeSetter.stream;

  void setVideos(List<PopularChannelList> list) {
    _videoSetter.sink.add(list);
  }

  void setLidhje(List<LidhjeItem> list) {
    _lidhjeSetter.sink.add(list);
  }

  void dispose() {
    _videoSetter.close();
    _lidhjeSetter.close();
  }
}

BallinaBloc ballinaBloc = BallinaBloc();