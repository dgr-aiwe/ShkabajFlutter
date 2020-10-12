import 'package:flutter/cupertino.dart';
import 'package:shkabaj_flutter/src/models/news.dart';
import 'package:shkabaj_flutter/src/ui/header.dart';


List<New> news = List();

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
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = List();
    for (int i = 0; i < news.length; i++) {
      pages.add(_Page(title: news[i].title, logo: "https://www.shkabaj.net/news/updates/" + news[i].logo));
    }

    return
      Column(
        children: [
          SectionHeader(itemType: HeaderType.Lajme),
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