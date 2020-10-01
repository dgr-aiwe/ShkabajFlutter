import 'package:flutter/cupertino.dart';

class CircularViewPager extends StatefulWidget {

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
    return
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 270,
            child: PageView(
              controller: _controller,
              children: [
                //pages
                _Page(),
                _Page()
              ],
            ),
          )
        ],
      );
  }
}

class _Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.ltr,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "lib/assets/images/shkabaj.png",
          height: 250,
          width: double.infinity,
        ),
        Text(
          "Description of the new"
        )
      ],
    );
  }
}