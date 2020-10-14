import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/models/resource.dart';
import 'package:shkabaj_flutter/src/ui/lajme/lajme.dart';
import 'package:shkabaj_flutter/src/ui/main/circular_viewpager.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';
import 'package:shkabaj_flutter/src/ui/main/daily_horizontal_scroll.dart';
import 'package:shkabaj_flutter/src/ui/main/header.dart';
import 'package:shkabaj_flutter/src/ui/main/horizontal_scrollview_one.dart';
import 'package:shkabaj_flutter/src/ui/main/horizontal_scrollview_two.dart';
import 'package:shkabaj_flutter/src/ui/main/moti.dart';
import 'package:shkabaj_flutter/src/ui/common/placeholder.dart';
import 'package:shkabaj_flutter/src/ui/main/viewModel/ballina_vm.dart';

void main() {
  runApp(BallinaScreen());
}

class BallinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext appContext) {
    return StreamBuilder(
      stream: bloc.locale,
      initialData: Locale("ru"),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return BallinaPage(locale: snapshot.data);
        }
        return Container();
      },
    );
  }
}

class BallinaPage extends StatelessWidget {
  final Locale locale;

  const BallinaPage({Key key, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Content(locale: locale),
        '/lajme' : (context) => LajmePage(locale: locale)
      },
      locale: locale,
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
    );
  }
}

class Content extends StatelessWidget {

  final Locale locale;

  const Content({Key key, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BallinaViewModel().loadData();

    return Scaffold(
        drawer: AppDrawer(),
        appBar: ShkabajAppBar(locale: locale),
        body: SingleChildScrollView(child: Container(
            color: Colors.white,
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
            )
        )
        )
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
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded) {
              HorizontalScrollViewOneTitle view = HorizontalScrollViewOneTitle();
              view.setVideoData((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            return ShimmerPlaceholder();
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
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded) {
              HorizontalScrollViewOneTitle view = HorizontalScrollViewOneTitle();
              view.setLidhjeData((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            return ShimmerPlaceholder();
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
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded) {
              HorizontalScrollViewTwoLines view = HorizontalScrollViewTwoLines();
              view.setTvData((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            return ShimmerPlaceholder();
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
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded
                && ((snapshot.data as Resource).data as List).isNotEmpty) {
              HorizontalScrollViewTwoLines view = HorizontalScrollViewTwoLines();
              view.setRadioData((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            else
              return ShimmerPlaceholder();
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
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded) {
              DailyVideoHorizontalScrollView view = DailyVideoHorizontalScrollView();
              view.setVideos((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            else
              return ShimmerPlaceholder();
          },
        )
      ],
    );
  }
}

class MotiSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ballinaBloc.moti,
        builder: (context, snapshot) {
          if (snapshot.data != null && (snapshot.data as Resource).isLoaded &&
              ((snapshot.data as Resource).data as Map) != null) {
            setMoti((snapshot.data as Resource).data);
            MotiViewPager view = MotiViewPager();
            return view;
          }
          else if (snapshot.data != null && !(snapshot.data as Resource).isLoaded) {
            return Container();
          }
          return ShimmerPlaceholder();
        }
    );
  }
}

class NewsSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: ballinaBloc.news,
          builder: (context, snapshot) {
            if (snapshot.data != null && (snapshot.data as Resource).isLoaded) {
              CircularViewPager view = CircularViewPager();
              view.setNews((snapshot.data as Resource).data);
              return view;
            }
            else if (snapshot.data != null &&
                !(snapshot.data as Resource).isLoaded) {
              return Container();
            }
            else return ShimmerPlaceholder();
          },
        )
      ],
    );
  }
}