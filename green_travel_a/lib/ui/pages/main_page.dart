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
    return DefaultTabController(
        length: _tabList.length,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            leading: Builder(builder: (BuildContext ctx) {
              return IconButton(
                  icon: Image.asset(
                    Utils.getImgPath(Ids.icon_title_user),
                    width: 24.0,
                    height: 24.0,
                  ),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  });
            }),
            title: InkWell(
              onTap: () {
                NavigatorUtil.showDemoDialog(
                    context,
                    SelectCityPage(
                      eventId: EventIds.main_page_city,
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(Dimens.gap_dp12),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Utils.getImgPath(Ids.icon_title_didi),
                        width: 21.0,
                        height: 16.8,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 3.0, right: 2.0),
                          child: Text(
                            "$_city",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 12.0),
                          )),
                      Image.asset(
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
              IconButton(
                  icon: Image.asset(
                    Utils.getImgPath(Ids.icon_title_msg),
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Image.asset(
                    Utils.getImgPath(Ids.icon_title_scan),
                    width: 20.0,
                    height: 20.0,
                  ),
                  onPressed: () {})
            ],
          ),
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Colours.app_main,
                            unselectedLabelColor: Colours.gray_99,
                            labelStyle: TextStyle(fontSize: 14),
                            unselectedLabelStyle: TextStyle(fontSize: 14),
                            tabs: _tabList.map((model) {
                              return Tab(
                                text: model.label ??
                                    IntlUtil.getString(context, model.labelId),
                              );
                            }).toList())),
                    IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colours.gray_99,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(
                    'Map Empty',
                    style: TextStyle(color: Colours.gray_66),
                  ),
                ),
              )),
              Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    iconSize: 32.0,
                    padding: const EdgeInsets.all(10.0),
                    icon: Image.asset(Utils.getImgPath(Ids.icon_map_loc)),
                    onPressed: () {}),
              ),
              Card(
                elevation: 2.0,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(2.0)),
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 40.0,
                                child: Image.asset(
                                  Utils.getImgPath(Ids.icon_addr_origin),
                                  width: 6.0,
                                  height: 6.0,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "正在获取上车点",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colours.green_62),
                              ))
                            ],
                          ),
                        )),
                    Container(
                      height: Dimens.border_width,
                      margin: EdgeInsets.only(left: 40.0),
                      color: Colours.gray_f0,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 40.0,
                                child: Image.asset(
                                  Utils.getImgPath(Ids.icon_addr_dest),
                                  width: 6.0,
                                  height: 6.0,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "你要去哪儿",
                                style: TextStyle(
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
          drawer: MainLeftPage(),
        ));
  }
}
