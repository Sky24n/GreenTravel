import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:lpinyin/lpinyin.dart';

class SelectCityPage extends StatefulWidget {
  SelectCityPage({Key key, this.eventId}) : super(key: key);

  final int eventId;

  @override
  State<StatefulWidget> createState() {
    return SelectCityPageState();
  }
}

class SelectCityPageState extends State<SelectCityPage> {
  List<CityInfo> _cityList = List();
  List<CityInfo> _hotCityList = List();

  int _suspensionHeight = 40;
  int _itemHeight = 50;
  String _suspensionTag = "★ 热门城市";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((value) {
        _cityList.add(CityInfo(name: value['name']));
      });
      _handleList(_cityList);

      _hotCityList.add(CityInfo(name: "北京市", tagIndex: "★"));
      _hotCityList.add(CityInfo(name: "广州市", tagIndex: "★"));
      _hotCityList.add(CityInfo(name: "成都市", tagIndex: "★"));
      _hotCityList.add(CityInfo(name: "深圳市", tagIndex: "★"));
      _hotCityList.add(CityInfo(name: "杭州市", tagIndex: "★"));
      _hotCityList.add(CityInfo(name: "武汉市", tagIndex: "★"));

      Observable.just(1).delay(new Duration(milliseconds: 300)).listen((_) {
        setState(() {
          //  _suspensionTag = _hotCityList[0].getSuspensionTag();
        });
      });
    });
  }

  void _handleList(List<CityInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    SuspensionUtil.sortListBySuspensionTag(list);
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = (tag == "★" ? "★ 热门城市" : tag);
    });
  }

  ///构建悬停Widget.
  Widget _buildSusWidget(String susTag) {
    return Container(
      height: _suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        (susTag == "★" ? "★ 热门城市" : susTag),
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  ///构建列表 item Widget.
  Widget _buildListItem(CityInfo model) {
    return new Container(
      child: new Column(
        children: <Widget>[
          Offstage(
            offstage: !(model.isShowSuspension == true),
            child: _buildSusWidget(model.getSuspensionTag()),
          ),
          Container(
            decoration: new BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: Dimens.border_width, color: Colours.gray_f5))),
            height: _itemHeight.toDouble(),
            child: ListTile(
              title: Text(
                model.name,
                style: new TextStyle(fontSize: 14),
              ),
              onTap: () {
                LogUtil.e("OnItemClick: $model");
                Event.sendAppEvent(
                    context, new ComEvent(id: widget.eventId, data: model));
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            height: 44.0,
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: false,
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      border: InputBorder.none,
                      labelStyle: new TextStyle(
                          fontSize: Dimens.font_sp14, color: Colours.gray_33),
                      hintText: '城市中文名或拼音',
                      hintStyle: new TextStyle(
                          fontSize: Dimens.font_sp14, color: Colours.gray_cc)),
                )),
                new Container(
                  width: Dimens.border_width,
                  height: 14.0,
                  color: Colours.gray_ef,
                ),
                new InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      "取消",
                      style: new TextStyle(
                          color: Colours.gray_99, fontSize: Dimens.font_sp14),
                    ),
                  ),
                )
              ],
            ),
          ),
          new Expanded(
              child: new Card(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
            shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
            ),
            child: new Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15.0),
                  height: 50.0,
                  child: Text("当前城市: 成都市"),
                ),
                Expanded(
                    child: new AzListView(
                  data: _cityList,
                  topData: _hotCityList,
                  itemBuilder: (context, model) => _buildListItem(model),
                  suspensionWidget: _buildSusWidget(_suspensionTag),
                  isUseRealIndex: true,
                  itemHeight: _itemHeight,
                  suspensionHeight: _suspensionHeight,
                  onSusTagChanged: _onSusTagChanged,
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
