import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';

class ShkabajAppBar extends StatelessWidget with PreferredSizeWidget {
  final Locale locale;

  const ShkabajAppBar({Key key, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.blue),
      actions: [
        RaisedButton(
          onPressed: () => changeLocale(),
          child: Text("Switch"),
        )
      ],
      title: Image.asset(
        'lib/assets/images/shkabaj.png',
        width: 210,
        height: 35,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(50);
  }

  void changeLocale() {
    if (locale.languageCode == "ru") {
      bloc.setLocale(Locale("en"));
    }
    else {
      bloc.setLocale(Locale("ru"));
    }
  }
}