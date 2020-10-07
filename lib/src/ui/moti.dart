import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotiViewPager extends StatefulWidget {

  @override
  State createState() {
    return _MotiViewPagerState();
  }
}

class _MotiViewPagerState extends State<MotiViewPager> with TickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _Tabs(tabController: tabController)
          ],
        )
      ],
    );
  }
}

class _Tabs extends StatelessWidget {

  final TabController tabController;

  const _Tabs({Key key, this.tabController}) : super(key: key);

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
              "Pristine", style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),Tab(
            child: Text(
              "Tirane", style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),Tab(
            child: Text(
              "Shkup", style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}