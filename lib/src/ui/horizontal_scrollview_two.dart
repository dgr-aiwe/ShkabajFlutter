import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/src/models/radio.dart';
import 'package:shkabaj_flutter/src/models/tv.dart';

class HorizontalScrollViewTwoLines extends StatelessWidget {
  List<TvItem> tvData = new List();
  List<RadioItem> radioData = new List();
  bool isTv;
  bool isRadio;

  void setTvData(List<TvItem> data) {
    this.tvData.addAll(data);
    isTv = true;
    isRadio = false;
  }

  void setRadioData(List<RadioItem> data) {
    this.radioData.addAll(data);
    isRadio = true;
    isTv = false;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    if (isTv) {
      for (int i = 0; i < tvData.length; i++) {
        list.add(ItemView(
          name: tvData[i].name,
          logo: "https://shkabaj.net/" + tvData[i].logo,
          location: tvData[i].location,
        ));
      }
    }
    else if (isRadio) {
      for (int i = 0; i < radioData.length; i++) {
        list.add(ItemView(
          name: radioData[i].name,
          logo: "https://www.shkabaj.net/mobi/ios/img/" + radioData[i].imageName,
          location: radioData[i].city,
        ));
      }
    }

    return Column(
      children: [
        Container(
          height: 155,
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
  final String name;
  final String logo;
  final String location;

  const ItemView({Key key, this.name, this.logo, this.location}) : super(key: key);

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
                  logo
                ),
              )
          ),
          Container(
              width: 150,
              child: Padding(
                child: Text(name, style: TextStyle(fontSize: 16), textAlign: TextAlign.start),
                padding: EdgeInsets.only(left: 5),
              )
          ),
          Container(
              width: 150,
              child: Padding(
                child: Text(location, style: TextStyle(fontSize: 16), textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
                padding: EdgeInsets.only(left: 5, top: 1),
              )
          )
        ],
      ),
    );
  }
}