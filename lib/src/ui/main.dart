import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';

void main() {
  runApp(BallinaScreen());
}

class BallinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.locale,
      initialData: Locale("en"),
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
      locale: snapshot.data,
      home: Scaffold(
        drawer: AppDrawer(),
        appBar: ShkabajAppBar(locale: snapshot.data),
        body: Text("")
      ),
    );
  }
}
