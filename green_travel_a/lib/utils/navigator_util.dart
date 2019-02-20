import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/widgets/com_scaffold.dart';
import 'package:green_travel_a/ui/widgets/web_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtil {
  static void pushPage(BuildContext context, Widget page) {
    if (context == null || page == null) return;
    Navigator.push(
        context, new CupertinoPageRoute<void>(builder: (ctx) => page));
  }

  static void pushPageBody(BuildContext context,
      {String title, String titleId, Widget body}) {
    if (context == null || body == null) return;
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => ComScaffold(
                  title: title,
                  titleId: titleId,
                  body: body,
                )));
  }

  static void pushWeb(BuildContext context,
      {String title, String titleId, String url}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title ?? titleId);
    } else {
      Navigator.push(
          context,
          new CupertinoPageRoute<void>(
              builder: (ctx) => new WebScaffold(
                    title: title,
                    titleId: titleId,
                    url: url,
                  )));
    }
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void showDemoDialog<T>(BuildContext context, Widget child) {
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    );
  }
}
