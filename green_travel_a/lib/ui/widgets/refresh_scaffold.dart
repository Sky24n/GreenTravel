import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/widgets/widgets.dart';

typedef void OnLoadMore(bool up);

class RefreshScaffold extends StatefulWidget {
  const RefreshScaffold(
      {Key key,
      this.labelId,
      this.isLoading,
      @required this.controller,
      this.enablePullUp: true,
      this.onRefresh,
      this.onLoadMore,
      this.child,
      this.itemCount,
      this.itemBuilder})
      : super(key: key);

  final String labelId;
  final bool isLoading;
  final RefreshController controller;
  final bool enablePullUp;
  final RefreshCallback onRefresh;
  final OnLoadMore onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() {
    return new RefreshScaffoldState();
  }
}

///   with AutomaticKeepAliveClientMixin
class RefreshScaffoldState extends State<RefreshScaffold>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new RefreshIndicator(
            child: new SmartRefresher(
                controller: widget.controller,
                enablePullDown: false,
                enablePullUp: widget.enablePullUp,
                enableOverScroll: false,
                onRefresh: widget.onLoadMore,
                child: widget.child ??
                    new ListView.builder(
                      itemCount: widget.itemCount,
                      itemBuilder: widget.itemBuilder,
                    )),
            onRefresh: widget.onRefresh),
        new Offstage(
          offstage: widget.isLoading != true,
          child: new Container(
            alignment: Alignment.center,
            color: Colours.gray_f0,
            child: new ProgressView(),
          ),
        )
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
