import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/pages/main_left_page.dart';
import 'package:green_travel_a/ui/pages/select_city_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ServiceModel> _tabList = Utils.getAllServices();
  String _city = "成都市";

  @override
  void initState() {
    super.initState();
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      switch (value.id) {
        case EventIds.main_page_city:
          CityInfo info = value.data;
          setState(() {
            _city = info.name;
          });
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _tabList.length,
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new MyAppBar(
            leading: new Image.asset(
              Utils.getImgPath(Ids.icon_title_user),
              width: 24.0,
              height: 24.0,
            ),
            title: new InkWell(
              onTap: () {
                NavigatorUtil.showDemoDialog(
                    context,
                    new SelectCityPage(
                      eventId: EventIds.main_page_city,
                    ));
              },
              child: new Container(
                padding: EdgeInsets.all(Dimens.gap_dp12),
                child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset(
                        Utils.getImgPath(Ids.icon_title_didi),
                        width: 21.0,
                        height: 16.8,
                      ),
                      new Container(
                          margin: const EdgeInsets.only(left: 3.0, right: 2.0),
                          child: new Text(
                            "$_city",
                            style: new TextStyle(
                                color: Colors.grey[700], fontSize: 12.0),
                          )),
                      new Image.asset(
                        Utils.getImgPath(Ids.icon_title_down),
                        width: 7.0,
                        height: 3.67,
                      ),
                    ]),
              ),
            ),
            centerTitle: true,
            elevation: 0,
            actions: <Widget>[
              new IconButton(
                  icon: new Image.asset(
                    Utils.getImgPath(Ids.icon_title_msg),
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: new Image.asset(
                    Utils.getImgPath(Ids.icon_title_scan),
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: () {})
            ],
          ),
          body: new Column(
            children: <Widget>[
              new Material(
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Colours.app_main,
                            unselectedLabelColor: Colours.gray_99,
                            labelStyle: new TextStyle(fontSize: 14),
                            unselectedLabelStyle: new TextStyle(fontSize: 14),
                            tabs: _tabList.map((model) {
                              return new Tab(
                                text: model.label ??
                                    IntlUtil.getString(context, model.labelId),
                              );
                            }).toList())),
                    new IconButton(
                        iconSize: 20,
                        icon: new Icon(
                          Icons.more_horiz,
                          color: Colours.gray_99,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
              new Expanded(child: new Container()),
              new Container(
                alignment: Alignment.bottomRight,
                child: new IconButton(
                    iconSize: 32.0,
                    padding: const EdgeInsets.all(10.0),
                    icon: new Image.asset(Utils.getImgPath(Ids.icon_map_loc)),
                    onPressed: () {}),
              ),
              new Card(
                elevation: 2.0,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(2.0)),
                ),
                child: new Column(
                  children: <Widget>[
                    new InkWell(
                        onTap: () {},
                        child: new Container(
                          height: 50.0,
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                width: 40.0,
                                child: new Image.asset(
                                  Utils.getImgPath(Ids.icon_addr_origin),
                                  width: 6.0,
                                  height: 6.0,
                                ),
                              ),
                              new Expanded(
                                  child: new Text(
                                "正在获取上车点",
                                style: new TextStyle(
                                    fontSize: 14.0, color: Colours.green_62),
                              ))
                            ],
                          ),
                        )),
                    new Container(
                      height: Dimens.border_width,
                      margin: EdgeInsets.only(left: 40.0),
                      color: Colours.gray_f0,
                    ),
                    new InkWell(
                        onTap: () {},
                        child: new Container(
                          height: 50.0,
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                width: 40.0,
                                child: new Image.asset(
                                  Utils.getImgPath(Ids.icon_addr_dest),
                                  width: 6.0,
                                  height: 6.0,
                                ),
                              ),
                              new Expanded(
                                  child: new Text(
                                "你要去哪儿",
                                style: new TextStyle(
                                    fontSize: 14.0, color: Colours.gray_ce),
                              ))
                            ],
                          ),
                        ))
                  ],
                ),
                margin: EdgeInsets.only(
                    left: 10.0, top: 6.0, right: 10.0, bottom: 10.0),
              )
            ],
          ),
          drawer: new MainLeftPage(),
        ));
  }
}
