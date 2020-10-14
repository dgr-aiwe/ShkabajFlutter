import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/blocs/moti_bloc.dart';
import 'package:shkabaj_flutter/src/models/moti.dart';

Map<City, Moti> motiMap = Map();
Moti moti = motiMap[City.Pr];

void setMoti(Map<City, Moti> _motiMap) {
  motiMap.addAll(_motiMap);
}

class MotiViewPager extends StatefulWidget {
  @override
  State createState() {
    return _MotiViewPagerState();
  }
}

class _MotiViewPagerState extends State<MotiViewPager>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: motiBlock.selectedTab,
      initialData: motiMap[City.Pr],
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Column(
            children: [
              Row(
                children: [
                  _Tabs(
                    tabController: tabController,
                    callback: updateState,
                  )
                ],
              ),
              _WeatherViewPager(
                moti: snapshot.data,
              )
            ],
          );
        }
        return Column();
      },
    );
  }
}

class _Tabs extends StatelessWidget {
  final TabController tabController;
  final VoidCallback callback;

  const _Tabs({Key key, this.tabController, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      _pageController.jumpTo(0);
      if (tabController.index == 0) {
        motiBlock.setTab(motiMap[City.Pr]);
        moti = motiMap[City.Pr];
      } else if (tabController.index == 1) {
        motiBlock.setTab(motiMap[City.Tir]);
        moti = motiMap[City.Tir];
      } else {
        motiBlock.setTab(motiMap[City.Shk]);
        moti = motiMap[City.Shk];
      }
      callback.call();
    });

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
PageController _pageController;

class _WeatherViewPagerState extends State<_WeatherViewPager> {
  Moti moti;

  _WeatherViewPagerState({this.moti});

  @override
  Widget build(BuildContext context) {
    _pageController = PageController();

    return Column(
      children: [
        Container(
          height: 150,
          child: PageView(
            onPageChanged: (value) => {updateValue(value.toDouble())},
            controller: _pageController,
            children: [
              FirstPage(),
              SecondPage(),
            ],
          ),
        ),
        Container(
          height: 30,
          child: Row(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount: 2,
                    position: _currentPage,
                  )
                ],
              ))
            ],
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
                                child: Image.network(
                                    moti.data.currentConditions.iconUrlExt,
                                    width: 40,
                                    height: 40),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(moti.data.currentConditions.temperature,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50)),
                              Text(
                                "Ndjehet si " +
                                    moti.data.currentConditions.FeelsLikeC,
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
        )
      ],
    );
  }
}

class SecondPage extends StatelessWidget {

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
                    Text(
                      "Lindja: " + moti.data.currentConditions.sunrise,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Perendimi: " + moti.data.currentConditions.sunset,
                          style: TextStyle(color: Colors.white, fontSize: 17))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                )
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
                    Text("Lageshtira: " + moti.data.currentConditions.humidity,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Era: " +
                            moti.data.currentConditions.windSpeed +
                            moti.data.currentConditions.windDirection,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Dushmerla: " +
                            moti.data.currentConditions.visibility +
                            "km",
                        style: TextStyle(color: Colors.white, fontSize: 17)),
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
