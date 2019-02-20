import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/pages/settings_page.dart';

class MainLeftPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainLeftPageState();
  }
}

class _MainLeftPageState extends State<MainLeftPage> {
  List<ItemInfo> _itemList = new List();

  @override
  void initState() {
    super.initState();
    _itemList.add(new ItemInfo());
    _itemList
        .add(new ItemInfo(titleId: Ids.my_trips, iconRes: Ids.icon_my_trips));
    _itemList
        .add(new ItemInfo(titleId: Ids.my_wallet, iconRes: Ids.icon_my_wallet));
    _itemList.add(new ItemInfo(
        titleId: Ids.customer_service, iconRes: Ids.icon_customer_service));
    _itemList
        .add(new ItemInfo(titleId: Ids.settings, iconRes: Ids.icon_settings));
  }

  Widget buildItem(ItemInfo info) {
    return new InkWell(
      onTap: () {
        switch (info.titleId) {
          case Ids.settings:
            NavigatorUtil.pushPageBody(
              context,
              titleId: Ids.settings,
              body: new SettingsPage(),
            );
            break;
          default:
            break;
        }
      },
      child: new Container(
          height: 42.0,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              new Container(
                padding: EdgeInsets.only(left: 30.0, right: 10.0),
                child: new Image.asset(
                  Utils.getImgPath(info.iconRes),
                  width: 18,
                  height: 18,
                ),
              ),
              new Text(
                IntlUtil.getString(context, info.titleId),
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 2,
      child: new Container(
        width: 240,
        padding: EdgeInsets.only(top: ScreenUtil.getInstance().statusBarHeight),
        child: new ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return new Container(
                  height: 120.0,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Gaps.vGap10,
                      new Image.asset(
                        Utils.getImgPath("icon_user_header_def"),
                        width: 60,
                        height: 60,
                      ),
                      Gaps.vGap10,
                      new Text(
                        "Sky24n",
                        style: new TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Gaps.vGap5,
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(right: 5.0),
                            child: new Image.asset(
                              Utils.getImgPath("icon_left_star"),
                              width: 10,
                              height: 10,
                            ),
                          ),
                          new Text(
                            "黄金会员",
                            style: new TextStyle(
                              fontSize: 12.0,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return buildItem(_itemList[index]);
              }
            }),
      ),
    );
  }
}
