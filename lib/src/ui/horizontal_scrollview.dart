import 'package:flutter/cupertino.dart';

class HorizontalScrollView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ItemView(),
              ItemView(),
              ItemView(),
              ItemView(),
              ItemView(),
              ItemView(),
              ItemView()
            ],
          ),
        )
      ],
    );
  }
}

class ItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.ltr,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            children: [
              Image.asset("lib/assets/images/shkabaj.png",
                width: 150,
                height: 50,
              ),
              Text(
                  "Item descrioption"
              )
            ],
          ),
        )
      ],
    );
  }
}