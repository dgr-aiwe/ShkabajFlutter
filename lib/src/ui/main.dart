import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';
import 'package:shkabaj_flutter/src/ui/header.dart';

void main() {
  runApp(ShkabajApp());
}

class ShkabajApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: BallinaScreen());
  }
}

class BallinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext appContext) {
    return StreamBuilder(
      stream: bloc.locale,
      initialData: Locale("ru"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
         return buildScreen(context, snapshot);
        }
        return Text("No data");
      },
    );
  }

  Widget buildScreen(BuildContext context, AsyncSnapshot<Locale> snapshot) {
    return MaterialApp(
      locale: snapshot.data,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: [
        const Locale("ru"),
        const Locale("en")
      ],
      home: Scaffold(
          drawer: AppDrawer(),
          appBar: ShkabajAppBar(locale: snapshot.data),
          body: Column(
            children: [
              SectionHeader(itemType: HeaderType.Lajme)
            ],
          )
      ),
    );
  }
}