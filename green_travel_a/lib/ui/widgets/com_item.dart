import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';
import 'package:green_travel_a/ui/widgets/widgets.dart';

class ComArrowItem extends StatelessWidget {
  const ComArrowItem(this.model, {Key key}) : super(key: key);
  final ComModel model;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        color: Colors.white,
        child: new ListTile(
          onTap: () {
            if (model.page == null) {
              NavigatorUtil.pushWeb(context,
                  title: model.title, url: model.url);
            } else {
              NavigatorUtil.pushPage(context, model.page);
            }
          },
          title: new Text(model.title == null ? "" : model.title),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                model.extra == null ? "" : model.extra,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
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
  }
}

class ComItem extends StatelessWidget {
  const ComItem(this.model, {Key key}) : super(key: key);
  final ComModel model;

  Widget _buildImg(ComModel model) {
    if (ObjectUtil.isEmpty(model.imgUrl) && ObjectUtil.isEmpty(model.avatar)) {
      return new Container(
        width: 0.0,
      );
    }
    if (!ObjectUtil.isEmpty(model.imgUrl)) {
      return new Container(
        width: 72,
        height: 128,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0),
        child: new CachedNetworkImage(
          width: 72,
          height: 128,
          fit: BoxFit.fill,
          imageUrl: model.imgUrl,
          placeholder: (context, url) => new ProgressView(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      );
    } else {
      return new Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 12.0),
        child: new CircleAvatar(
          radius: 28.0,
          backgroundColor: Colours.gray_f0,
          backgroundImage: new CachedNetworkImageProvider(model.avatar),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        NavigatorUtil.pushWeb(context, title: model.title, url: model.url);
      },
      child: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    Utils.getString(model.title),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTitle,
                  ),
                  Gaps.vGap10,
                  new Text(
                    Utils.getString(model.content),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listContent,
                  ),
                  Gaps.vGap5,
                  new Row(
                    children: <Widget>[
                      new Text(
                        Utils.getString(model.author),
                        style: TextStyles.listExtra,
                      ),
                      Gaps.hGap10,
                      new Text(
                        Utils.getTimeLine(context,
                            DateUtil.getDateMsByTimeStr(model.updatedAt)),
                        style: TextStyles.listExtra,
                      ),
                    ],
                  )
                ],
              )),
              _buildImg(model),
            ],
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 0.33, color: Colours.divider))),
    );
  }
}
