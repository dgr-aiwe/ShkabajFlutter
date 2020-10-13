import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/models/lidhje.dart';
import 'package:shkabaj_flutter/src/models/video.dart';

class HorizontalScrollViewOneTitle extends StatelessWidget {
  bool isVideo;
  bool isLidhje;

  List<PopularChannelList> videoData = new List();
  List<LidhjeItem> lidhjeData = new List();

  void setVideoData(List<PopularChannelList> data) {
    this.videoData.addAll(data);
    isVideo = true;
    isLidhje = false;
  }

  void setLidhjeData(List<LidhjeItem> data) {
    this.lidhjeData.addAll(data);
    isVideo = false;
    isLidhje = true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    if (isVideo) {
      for (int i = 0; i < videoData.length; i++) {
        list.add(ItemView(
          videoName: videoData[i].name,
          logo: videoData[i].logo,
        ));
      }
    } else if (isLidhje) {
      for (int i = 0; i < lidhjeData.length; i++) {
        list.add(ItemView(
          videoName: lidhjeData[i].name,
          logo: lidhjeData[i].logo,
        ));
      }
    }

    return Column(
      children: [
        Container(
          height: 135,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [...list],
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 3,
              child: Container(
                width: 150,
                height: 84,
                child: Image.network(
                  "https://shkabaj.net/" + logo.substring(3),
                ),
              )
          ),
          Container(
              width: 150,
              child: Padding(
                child: Text(videoName, style: TextStyle(fontSize: 16), textAlign: TextAlign.start),
                padding: EdgeInsets.only(left: 5),
              )
          )
        ],
      ),
    );
  }
}