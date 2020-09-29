import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LocalizationBlock {
  final _localeSetter = PublishSubject<Locale>();

  Observable<Locale> get locale => _localeSetter.stream;

  setLocale(Locale locale) {
    _localeSetter.sink.add(locale);
  }

  dispose() {
    _localeSetter.close();
  }
}

final bloc = LocalizationBlock();