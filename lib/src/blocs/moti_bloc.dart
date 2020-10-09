import 'package:rxdart/rxdart.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';

class MotiBlock {
  PublishSubject<Moti> _publishSubject = PublishSubject();

  Observable<Moti> get selectedTab => _publishSubject.stream;

  void setTab(Moti value) {
      _publishSubject.sink.add(value);
  }
}

MotiBlock motiBlock = MotiBlock();