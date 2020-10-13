import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shkabaj_flutter/src/models/news.dart';


List<New> news = List();
List<Widget> pages = List();

class CircularViewPager extends StatefulWidget {

  void setNews(List<New> _news) {
    news.addAll(_news);
  }

  @override
  State createState() {
    return _CircularViewPagerState();
  }
}

class _CircularViewPagerState extends State<CircularViewPager> {
  PageController _controller = PageController(
    initialPage: 2,
  );

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 7), (timer) { _controller.animateToPage((_controller.page + 1).toInt(),
        duration: Duration(milliseconds: 250), curve: Curves.easeIn); });

    _controller..addListener(() {

      if (_controller.page.toInt() == pages.length - 1) {
        _controller.jumpToPage(1);
      }
      else if (_controller.page.toInt() == 0) {
        Future.delayed(Duration(milliseconds: 380), () => { _controller.jumpToPage(pages.length - 2) });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    pages.add(_Page(title: news[news.length - 1].title,
        logo: "https://www.shkabaj.net/news/updates/" + news[news.length - 1].logo));

    for (int i = 0; i < news.length; i++) {
      pages.add(_Page(title: news[i].title, logo: "https://www.shkabaj.net/news/updates/" + news[i].logo));
    }

    pages.add(_Page(title: news[0].title,
        logo: "https://www.shkabaj.net/news/updates/" + news[0].logo));

    return
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 340,
            child: PageView(
              controller: _controller,
              children: [
                ...pages
              ],
            ),
          )
        ],
      );
  }
}

class _Page extends StatelessWidget {
  final String title;
  final String logo;

  const _Page({Key key, this.title, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.ltr,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          logo,
          height: 220,
          width: double.infinity,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title, maxLines: 4, style: TextStyle(fontSize: 23),
                ),
              )
            )
          ],
        )
      ],
    );
  }
}