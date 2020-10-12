import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';

class SectionHeader extends StatelessWidget {
  final HeaderType itemType;

  const SectionHeader({Key key, this.itemType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = defineString(context);
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

  String defineString(BuildContext context) {
    switch(itemType) {
      case HeaderType.Lajme: {
        return S.of(context).lajme_title;
      }
      break;

      case HeaderType.DailyVideos: {
        return S.of(context).daily_video_title;
      }
      break;

      case HeaderType.Radio: {
        return S.of(context).radio_title;
      }
      break;

      case HeaderType.Video: {
        return S.of(context).video_title;
      }
      break;

      case HeaderType.Moti: {
        return S.of(context).moti_title;
      }
      break;

      case HeaderType.Tv: {
        return S.of(context).tv_title;
      }
      break;

      case HeaderType.Lidhje: {
        return S.of(context).lidhje_title;
      }
      break;
    }
  }
}

enum HeaderType {
  Lajme,
  DailyVideos,
  Radio,
  Video,
  Moti,
  Tv,
  Lidhje
}
