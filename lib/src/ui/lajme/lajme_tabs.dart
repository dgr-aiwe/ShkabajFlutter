import 'package:flutter/material.dart';

class LajmeTabs extends StatefulWidget {

  @override
  State createState() {
    return _LajmeTabsState();
  }
}

class _LajmeTabsState extends State<LajmeTabs> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Tab(child: Text("Kryesoret", style: TextStyle(color: Colors.black))),
              Tab(child: Text("Tjerat", style: TextStyle(color: Colors.black))),
              Tab(child: Text("Media", style: TextStyle(color: Colors.black))),
              Tab(child: Text("Audio",style: TextStyle(color: Colors.black))),
              Tab(child: Text("Te Ruajturat", style: TextStyle(color: Colors.black))),
            ],
          ),
        )
      ],
    );
  }
}