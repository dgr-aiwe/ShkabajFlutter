import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/src/ui/lajme/lajme_tabs.dart';

class LajmeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.locale,
      initialData: Locale("ru"),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              S.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: snapshot.data,
            home: LajmePage(locale: snapshot.data),
          );
        }
        else return Container();
      },
    );
  }
}

class LajmePage extends StatelessWidget {

  final Locale locale;

  const LajmePage({Key key, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShkabajAppBar(locale: locale),
      drawer: AppDrawer(),
      body: Column(
        children: [
          LajmeTabs()
        ],
      ),
    );
  }
}
