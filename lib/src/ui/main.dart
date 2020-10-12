import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';
import 'package:shkabaj_flutter/src/ui/circular_viewpager.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';
import 'package:shkabaj_flutter/src/ui/daily_horizontal_scroll.dart';
import 'package:shkabaj_flutter/src/ui/header.dart';
import 'package:shkabaj_flutter/src/ui/horizontal_scrollview_one.dart';
import 'package:shkabaj_flutter/src/ui/horizontal_scrollview_two.dart';
import 'package:shkabaj_flutter/src/ui/moti.dart';
import 'package:shkabaj_flutter/src/ui/viewModel/ballina_vm.dart';

void main() {
  runApp(ShkabajApp());
}

bool shouldLoadData = true;

class ShkabajApp extends StatelessWidget {
  BallinaViewModel viewModel = BallinaViewModel();
  @override
  Widget build(BuildContext context) {
    if (shouldLoadData) {
      viewModel.loadData();
      shouldLoadData = false;
      debugPrint("init");
    }

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                NewsSection(),
                DailyVideoSection(),
                RadioSection(),
                VideoSection(),
                MotiSection(),
                TvSection(),
                LidhjeSection()
              ],
            ),
          )
      ),
    );
  }
}

class VideoSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(itemType: HeaderType.Video),
        StreamBuilder(
          stream: ballinaBloc.videos,
          builder: (context, snapshot) {
            if (snapshot.data != null && (snapshot.data as List).isNotEmpty) {
              HorizontalScrollViewOneTitle view = HorizontalScrollViewOneTitle();
              view.setVideoData(snapshot.data);
              return view;
            }
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class LidhjeSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(itemType: HeaderType.Lidhje),
        StreamBuilder(
          stream: ballinaBloc.lidhje,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              HorizontalScrollViewOneTitle view = HorizontalScrollViewOneTitle();
              view.setLidhjeData(snapshot.data);
              return view;
            }
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class TvSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(itemType: HeaderType.Tv),
        StreamBuilder(
          stream: ballinaBloc.tv,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              HorizontalScrollViewTwoLines view = HorizontalScrollViewTwoLines();
              view.setTvData(snapshot.data);
              return view;
            }
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class RadioSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(itemType: HeaderType.Radio),
        StreamBuilder(
          stream: ballinaBloc.radio,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              HorizontalScrollViewTwoLines view = HorizontalScrollViewTwoLines();
              view.setRadioData(snapshot.data);
              return view;
            }
            else return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class DailyVideoSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(itemType: HeaderType.DailyVideos),
        StreamBuilder(
          stream: ballinaBloc.dailyVideos,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              DailyVideoHorizontalScrollView view = DailyVideoHorizontalScrollView();
              view.setVideos(snapshot.data);
              return view;
            }
            else return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class MotiSection extends StatelessWidget {
  Map<City, Moti> motis = Map();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ballinaBloc.moti,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          debugPrint((snapshot.data as Moti).city.toString());
          motis[(snapshot.data as Moti).city] = snapshot.data;
          if (motis.length == 3) {
            setMoti(motis);
            MotiViewPager view = MotiViewPager();
            return view;
          }
          return CircularProgressIndicator();
        }
        else return CircularProgressIndicator();
      },
    );
  }
}

class NewsSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ballinaBloc.news,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          CircularViewPager view = CircularViewPager();
          view.setNews(snapshot.data);
          return view;
        }
        return CircularProgressIndicator();
      },
    );
  }
}