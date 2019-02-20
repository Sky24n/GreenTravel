import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({
    Key key,
    this.title,
    this.titleId,
    this.url,
  }) : super(key: key);

  final String title;
  final String titleId;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return new WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        NavigatorUtil.launchInBrowser(widget.url,
            title: widget.title ?? IntlUtil.getString(context, widget.titleId));
        break;
      case "collection":
        break;

      case "share":
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title ?? IntlUtil.getString(context, widget.titleId),
          maxLines: 1,
          style: new TextStyle(
              color: Colours.text_dark,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton(
              icon: Icon(Icons.more_horiz),
              padding: const EdgeInsets.all(0.0),
              onSelected: _onPopSelected,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: "browser",
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: new Container(
                              alignment: Alignment.center,
                              child: new Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.language,
                                    color: Colours.gray_66,
                                    size: 22.0,
                                  ),
                                  Gaps.hGap10,
                                  Text(
                                    '浏览器打开',
                                    style: TextStyles.listContent,
                                  )
                                ],
                              ),
                            ))),
                    new PopupMenuItem<String>(
                        value: "share",
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: new Container(
                              alignment: Alignment.center,
                              child: new Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.share,
                                    color: Colours.gray_66,
                                    size: 22.0,
                                  ),
                                  Gaps.hGap10,
                                  Text(
                                    '分享',
                                    style: TextStyles.listContent,
                                  )
                                ],
                              ),
                            ))),
                  ])
        ],
      ),
      body: new WebView(
        onWebViewCreated: (WebViewController webViewController) {},
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
