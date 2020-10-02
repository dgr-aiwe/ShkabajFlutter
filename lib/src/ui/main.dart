import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shkabaj_flutter/src/blocs/localization_bloc.dart';
import 'package:shkabaj_flutter/src/blocs/ballina_bloc.dart';
import 'package:shkabaj_flutter/src/ui/circular_viewpager.dart';
import 'package:shkabaj_flutter/src/ui/common/app_bar.dart';
import 'package:shkabaj_flutter/src/ui/common/drawer.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';
import 'package:shkabaj_flutter/src/ui/header.dart';
import 'package:shkabaj_flutter/src/ui/horizontal_scrollview.dart';
import 'package:shkabaj_flutter/src/ui/viewModel/ballina_vm.dart';

void main() {
  runApp(ShkabajApp());
}

class ShkabajApp extends StatelessWidget {
  BallinaViewModel viewModel = BallinaViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.loadData();
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
                SectionHeader(itemType: HeaderType.Lajme),
                CircularViewPager(),
                SectionHeader(itemType: HeaderType.DailyVideos),
                //HorizontalScrollView(),
                SectionHeader(itemType: HeaderType.Radio),
                //HorizontalScrollView(),
                VideoSection(),
                SectionHeader(itemType: HeaderType.Moti),
                CircularViewPager(),
                SectionHeader(itemType: HeaderType.Tv),
                //HorizontalScrollView(),
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
              HorizontalScrollView view = HorizontalScrollView();
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
              HorizontalScrollView view = HorizontalScrollView();
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