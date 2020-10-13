import 'package:rxdart/rxdart.dart';
import 'package:shkabaj_flutter/src/models/resource.dart';

class BallinaBloc {

  final _videoSubject = PublishSubject<Resource>();
  final _lidhjeSubject = PublishSubject<Resource>();
  final _tvSubject = PublishSubject<Resource>();
  final _radioSubject = PublishSubject<Resource>();
  final _dailyVideoSubjet = PublishSubject<Resource>();
  final _motiSubject = BehaviorSubject<Resource>();
  final _newsSubject = PublishSubject<Resource>();

  Observable<Resource> get videos => _videoSubject.stream;
  Observable<Resource> get lidhje => _lidhjeSubject.stream;
  Observable<Resource> get tv => _tvSubject.stream;
  Observable<Resource> get radio => _radioSubject.stream;
  Observable<Resource> get dailyVideos => _dailyVideoSubjet.stream;
  Observable<Resource> get moti => _motiSubject.stream;
  Observable<Resource> get news => _newsSubject.stream;

  void setVideos(Resource list) {
    _videoSubject.sink.add(list);
  }

  void setLidhje(Resource list) {
    _lidhjeSubject.sink.add(list);
  }

  void setTv(Resource list) {
    _tvSubject.sink.add(list);
  }

  void setRadios(Resource list) {
    _radioSubject.sink.add(list);
  }

  void setDailyVideos(Resource list) {
    _dailyVideoSubjet.sink.add(list);
  }

  void setMoti(Resource _map) {
    _motiSubject.sink.add(_map);
  }

  void setNews(Resource news) {
    _newsSubject.sink.add(news);
  }

  void dispose() {
    _videoSubject.close();
    _lidhjeSubject.close();
    _tvSubject.close();
    _radioSubject.close();
    _dailyVideoSubjet.close();
    _motiSubject.close();
    _newsSubject.close();
  }
}

BallinaBloc ballinaBloc = BallinaBloc();