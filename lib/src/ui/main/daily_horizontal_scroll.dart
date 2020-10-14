import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/models/daily_video.dart';

class DailyVideoHorizontalScrollView extends StatelessWidget {

  List<DailyVideoItem> videos;

  void setVideos(List<DailyVideoItem> videos) {
    this.videos = videos;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();

    for (int i = 0; i < videos.length; i++) {
      widgets.add(DailyItem(
        title: videos[i].snippet.title,
        duration: buildDuration(i),
        logo: videos[i].snippet.thumbnails.medium.url));
    }

    return Column(
      children: [
        Container(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...widgets
            ],
          ),
        )
      ],
    );
  }

  String buildDuration(int i){
    // String time = videos[i].contentDetails.duration.substring(2);
    // int minutesIndex = time.indexOf("M");
    // String minutes = "00";
    // String seconds = "00";
    // if (minutesIndex != -1) {
    //   minutes = time.substring(0, minutesIndex);
    //   int.parse(minutes) < 10 ? minutes = "0" + minutes : minutes = minutes;
    //   seconds = time.substring(minutesIndex + 1, time.length - 1);
    //   int.parse(seconds) < 10 ? seconds = "0" + seconds : seconds = seconds;
    //   return minutes + ":" + seconds;
    // }
    // else if (videos[i].contentDetails.duration.contains('S')) {
    //   seconds = time.substring(0, time.length - 1);
    //   int.parse(seconds) < 10 ? seconds = "0" + seconds : seconds = seconds;
    //   return minutes + ":" + seconds;
    // }
    return videos[i].contentDetails.duration;
  }
}

class DailyItem extends StatelessWidget {
  final String title;
  final String duration;
  final String logo;

  const DailyItem({Key key, this.title, this.duration, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Card(
            elevation: 3,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 84,
                  child: Stack(
                    children: [
                      Positioned.fill(child:
                        Image.network(logo)),
                      Container(
                        alignment: Alignment.bottomRight,
                        height: 84,
                        width: 150,
                        child: Container(
                          color: Colors.black26,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Text(duration, style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 150,
          alignment: Alignment.topLeft,
          child: Text(
              title, style: TextStyle(fontSize: 16), maxLines: 4,
          ),
        )
      ],
    );
  }
}