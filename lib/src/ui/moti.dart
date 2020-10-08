import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';

class MotiViewPager extends StatefulWidget {
  Moti moti;

  void setMoti(Moti moti) {
    this.moti = moti;
  }

  @override
  State createState() {
    return _MotiViewPagerState(moti: moti);
  }
}

class _MotiViewPagerState extends State<MotiViewPager>
    with TickerProviderStateMixin {
  TabController tabController;
  Moti moti;

  _MotiViewPagerState({this.moti});

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [_Tabs(tabController: tabController)],
        ),
        _WeatherViewPager(moti: moti,)
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  final TabController tabController;
  final Moti moti;

  const _Tabs({Key key, this.tabController, this.moti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TabBar(
        controller: tabController,
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey,
        ),
        tabs: [
          Tab(
            child: Text(
              "Pristine",
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),
          Tab(
            child: Text(
              "Tirane",
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),
          Tab(
            child: Text(
              "Shkup",
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherViewPager extends StatefulWidget {
  final Moti moti;

  const _WeatherViewPager({Key key, this.moti}) : super(key: key);

  @override
  State createState() {
    return _WeatherViewPagerState(moti: moti);
  }
}

double _currentPage = 0;

class _WeatherViewPagerState extends State<_WeatherViewPager> {
  PageController _controller = PageController();
  Moti moti;

  _WeatherViewPagerState({this.moti});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: PageView(
            onPageChanged: (value) => {updateValue(value.toDouble())},
            controller: _controller,
            children: [
              FirstPage(moti: moti,),
              SecondPage(moti: moti,),
            ],
          ),
        ),
        Container(
          height: 30,
          child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount: 2,
                    position: _currentPage,)
                ],
              )
          ),
        )
      ],
    );
  }
  void updateValue(double value) {
    setState(() {
      _currentPage = value;
    });
  }
}

class FirstPage extends StatelessWidget {
  Moti moti;

 FirstPage({Key key, this.moti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Colors.blue,
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("MOTI\nTANI",
                        style: TextStyle(fontSize: 35, color: Colors.white)),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Image.network(moti.data.currentConditions.iconUrlExt,
                                  width: 40, height: 40),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(moti.data.currentConditions.temperature,
                                style:
                                TextStyle(color: Colors.white, fontSize: 50)),
                            Text(
                              "Ndjehet si " + moti.data.currentConditions.FeelsLikeC,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Moti moti;
  SecondPage({Key key, this.moti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lindja: " + moti.data.currentConditions.sunrise, style: TextStyle(color: Colors.white, fontSize: 17),),
                  ],
                )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Perendimi: " + moti.data.currentConditions.sunset, style: TextStyle(color: Colors.white, fontSize: 17))],
                  ),
                ),
                Expanded(child: Container(),)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lageshtira: " + moti.data.currentConditions.humidity, style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Era: " + moti.data.currentConditions.windSpeed + moti.data.currentConditions.windDirection,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dushmerla: " + moti.data.currentConditions.visibility + "km", style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
