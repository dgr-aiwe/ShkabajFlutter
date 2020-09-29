import 'package:flutter/material.dart';
import 'package:shkabaj_flutter/generated/l10n.dart';

// ignore: must_be_immutable
var selectedItem = DrawerItemsEnum.BALLINA;
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return
      Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xE5FFFFFF)
        ),
        child: Drawer(
            child: Container(
              child: ListView(
                children: [
                  DrawerHeader(
                      child:
                      Container(
                        child: Image.asset('lib/assets/images/shkabaj.png'),
                        padding: EdgeInsets.all(40),
                      )
                  ),
                  DrawerItem(itemName: S.of(context).ballina_title, type: DrawerItemsEnum.BALLINA,),
                  DrawerItem(itemName: S.of(context).lajme_title, type: DrawerItemsEnum.LAJME,),
                  DrawerItem(itemName: S.of(context).radio_title, type: DrawerItemsEnum.RADIO,),
                  DrawerItem(itemName: S.of(context).video_title, type: DrawerItemsEnum.VIDEO,),
                  DrawerItem(itemName: S.of(context).moti_title, type: DrawerItemsEnum.MOTI,),
                  DrawerItem(itemName: S.of(context).konfig_title, type: DrawerItemsEnum.KONFIG,),
                ],
              ),
            )
        ),
      );
  }
}

void _onItemClick(BuildContext context, DrawerItemsEnum type) {
  Navigator.pop(context);
  selectedItem = type;
}

enum DrawerItemsEnum {
  BALLINA,
  LAJME,
  RADIO,
  VIDEO,
  MOTI,
  KONFIG
}

class SelectedDrawerItem extends StatelessWidget {
  final String itemName;

  const SelectedDrawerItem({Key key, this.itemName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage('lib/assets/images/triangle.png'),
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6, top: 12, right: 24, bottom: 12),
          child: Row(
            children: [
              Text(itemName,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class NonSelectedDrawerItem extends StatelessWidget {
  final String itemName;

  const NonSelectedDrawerItem({Key key, this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 28, top: 12, right: 24, bottom: 12),
          child:
          Text(itemName,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String itemName;
  final DrawerItemsEnum type;

  const DrawerItem({Key key, this.itemName, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          selectedItem == type ? SelectedDrawerItem(itemName: itemName,)
              : NonSelectedDrawerItem(itemName: itemName)
        ],
      ),
      onTap: () => {
        _onItemClick(context, type)
      },
    );
  }
}