import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/pages/author_page.dart';
import 'package:green_travel_a/ui/pages/language_page.dart';
import 'package:green_travel_a/ui/widgets/index.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  MainBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<MainBloc>(context);
    bloc.getVersion();
  }

  @override
  Widget build(BuildContext context) {
    ComModel language = new ComModel(
        title: IntlUtil.getString(context, Ids.language),
        page: new LanguagePage());
    ComModel author = new ComModel(
        title: IntlUtil.getString(context, Ids.about_app), page: AuthorPage());
    return new Container(
      color: Colours.app_bg,
      child: new ListView(
        children: <Widget>[
          new ComArrowItem(language),
          Gaps.vGap10,
          new StreamBuilder(
              stream: bloc.versionStream,
              builder:
                  (BuildContext context, AsyncSnapshot<VersionModel> snapshot) {
                VersionModel model = snapshot.data;
                bool isUp = (model != null &&
                    Utils.getUpdateStatus(model.version) != 0);
                return new Container(
                  child: new Material(
                    color: Colors.white,
                    child: new ListTile(
                      onTap: () {
                        if (model == null) {
                          bloc.getVersion();
                        } else {
                          if (Utils.getUpdateStatus(model.version) != 0) {
                            NavigatorUtil.launchInBrowser(model.url,
                                title: model.title);
                          }
                        }
                      },
                      title: new Text('版本更新'),
                      //dense: true,
                      trailing: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            isUp ? '有新版本，去更新吧' : ('v' + AppConfig.version),
                            style: TextStyle(
                                color: isUp ? Colors.red : Colors.grey,
                                fontSize: 14.0),
                          ),
                          new Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: Decorations.bottom,
                );
              }),
          new ComArrowItem(author),
          Gaps.vGap10,
          new InkWell(
            child: new Container(
              height: Dimens.btn_h_48,
              color: Colors.white,
              child: new Center(
                child: new Text(
                  IntlUtil.getString(context, Ids.log_out),
                  style: new TextStyle(color: Colours.app_main, fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
