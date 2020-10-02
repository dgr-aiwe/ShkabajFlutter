import 'package:flutter/cupertino.dart';
import 'package:shkabaj_flutter/src/models/popular_channel_list.dart';

class HorizontalScrollView extends StatelessWidget {

  List<PopularChannelList> data = new List();

  void setData(List<PopularChannelList> data) {
    this.data.addAll(data);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    for (int i = 0; i < data.length; i++) {
      list.add(ItemView(
        videoName: data[i].name,
        logo: data[i].logo,
      ));
    }

    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...list
            ],
          ),
        )
      ],
    );
  }
}

class ItemView extends StatelessWidget {

  final String videoName;
  final String logo;

  const ItemView({Key key, this.videoName, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      textDirection: TextDirection.ltr,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://shkabaj.net/" + logo.substring(3),
                height: 80,
              ),

              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(videoName,
                  style: TextStyle(
                      fontSize: 17
                  ),
                )
              )
            ]
          ),
        )
      ],
    );
  }
}