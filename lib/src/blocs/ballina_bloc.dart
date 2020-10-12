import 'package:rxdart/rxdart.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';
import 'package:shkabaj_flutter/src/models/lidhje.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';
import 'package:shkabaj_flutter/src/models/news.dart';
import 'package:shkabaj_flutter/src/models/popular_channel_list.dart';
import 'package:shkabaj_flutter/src/models/radio.dart';
import 'package:shkabaj_flutter/src/models/tv.dart';

class BallinaBloc {

  final _videoSetter = PublishSubject<List<PopularChannelList>>();
  final _lidhjeSetter = PublishSubject<List<LidhjeItem>>();
  final _tvSetter = PublishSubject<List<TvItem>>();
  final _radioSetter = PublishSubject<List<RadioItem>>();
  final _dailyVideoSetter = PublishSubject<List<DailyVideoItem>>();
  final _motiSetter = BehaviorSubject<Map<City, Moti>>();
  final _newsSetter = PublishSubject<List<New>>();

  Observable<List<PopularChannelList>> get videos => _videoSetter.stream;
  Observable<List<LidhjeItem>> get lidhje => _lidhjeSetter.stream;
  Observable<List<TvItem>> get tv => _tvSetter.stream;
  Observable<List<RadioItem>> get radio => _radioSetter.stream;
  Observable<List<DailyVideoItem>> get dailyVideos => _dailyVideoSetter.stream;
  Observable<Map<City, Moti>> get moti => _motiSetter.stream;
  Observable<List<New>> get news => _newsSetter.stream;

  void setVideos(List<PopularChannelList> list) {
    _videoSetter.sink.add(list);
  }

  void setLidhje(List<LidhjeItem> list) {
    _lidhjeSetter.sink.add(list);
  }

  void setTv(List<TvItem> list) {
    _tvSetter.sink.add(list);
  }

  void setRadios(List<RadioItem> list) {
    _radioSetter.sink.add(list);
  }

  void setDailyVideos(List<DailyVideoItem> list) {
    _dailyVideoSetter.sink.add(list);
  }

  void setMoti(Map<City, Moti> _map) {
    _motiSetter.sink.add(_map);
  }

  void setNews(List<New> news) {
    _newsSetter.sink.add(news);
  }

  void dispose() {
    _videoSetter.close();
    _lidhjeSetter.close();
    _tvSetter.close();
    _radioSetter.close();
    _dailyVideoSetter.close();
    _motiSetter.close();
    _newsSetter.close();
  }
}

BallinaBloc ballinaBloc = BallinaBloc();