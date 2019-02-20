import 'package:azlistview/azlistview.dart';
import 'package:flutter/widgets.dart';

class LanguageModel {
  String titleId;
  String languageCode;
  String countryCode;
  bool isSelected;

  LanguageModel(this.titleId, this.languageCode, this.countryCode,
      {this.isSelected: false});

  LanguageModel.fromJson(Map<String, dynamic> json)
      : titleId = json['titleId'],
        languageCode = json['languageCode'],
        countryCode = json['countryCode'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
        'titleId': titleId,
        'languageCode': languageCode,
        'countryCode': countryCode,
        'isSelected': isSelected,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"titleId\":\"$titleId\"");
    sb.write(",\"languageCode\":\"$languageCode\"");
    sb.write(",\"countryCode\":\"$countryCode\"");
    sb.write('}');
    return sb.toString();
  }
}

class SplashModel {
  String title;
  String content;
  String url;
  String imgUrl;
  String extraUrl;

  SplashModel({this.title, this.content, this.url, this.imgUrl, this.extraUrl});

  SplashModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        imgUrl = json['imgUrl'],
        extraUrl = json['extraUrl'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'url': url,
        'imgUrl': imgUrl,
        'extraUrl': extraUrl,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write(",\"extraUrl\":\"$extraUrl\"");
    sb.write('}');
    return sb.toString();
  }
}

class VersionModel {
  String title;
  String content;
  String url;
  String version;

  VersionModel({this.title, this.content, this.url, this.version});

  VersionModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        url = json['url'],
        version = json['version'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'url': url,
        'version': version,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"version\":\"$version\"");
    sb.write('}');
    return sb.toString();
  }
}

class ComModel {
  String version;
  String title;
  String content;
  String extra;
  String url;
  String imgUrl;
  String author;
  String avatar;
  String updatedAt;

  String titleId;

  Widget page;

  ComModel(
      {this.version,
      this.title,
      this.content,
      this.extra,
      this.url,
      this.imgUrl,
      this.author,
      this.avatar,
      this.updatedAt,
      this.titleId,
      this.page});

  ComModel.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        title = json['title'],
        content = json['content'],
        extra = json['extra'],
        url = json['url'],
        imgUrl = json['imgUrl'],
        author = json['author'],
        avatar = json['avatar'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'version': version,
        'title': title,
        'content': content,
        'extra': extra,
        'url': url,
        'imgUrl': imgUrl,
        'author': author,
        'avatar': avatar,
        'updatedAt': updatedAt,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"version\":\"$version\"");
    sb.write(",\"title\":\"$title\"");
    sb.write(",\"content\":\"$content\"");
    sb.write(",\"extra\":\"$extra\"");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imgUrl\":\"$imgUrl\"");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"avatar\":\"$avatar\"");
    sb.write(",\"updatedAt\":\"$updatedAt\"");
    sb.write('}');
    return sb.toString();
  }
}

class ServiceModel {
  int tabId;
  String label;
  String labelId;
  String iconRes;
  String iconUrl;
  String url;

  ServiceModel({
    this.tabId,
    this.label,
    this.labelId,
    this.iconRes,
    this.iconUrl,
    this.url,
  });

  ServiceModel.fromJson(Map<String, dynamic> json)
      : tabId = json['tabId'],
        label = json['label'],
        labelId = json['labelId'],
        iconRes = json['iconRes'],
        iconUrl = json['iconUrl'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'tabId': tabId,
        'label': label,
        'labelId': labelId,
        'iconRes': iconRes,
        'iconUrl': iconUrl,
        'url': url,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"tabId\":$tabId");
    sb.write(",\"label\":\"$label\"");
    sb.write(",\"labelId\":\"$labelId\"");
    sb.write(",\"iconRes\":\"$iconRes\"");
    sb.write(",\"iconUrl\":\"$iconUrl\"");
    sb.write(",\"url\":\"$url\"");
    sb.write('}');
    return sb.toString();
  }
}

class CityInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;

  CityInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  CityInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'] == null ? "" : json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagIndex': tagIndex,
        'namePinyin': namePinyin,
        'isShowSuspension': isShowSuspension
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}

class ItemInfo {
  String titleId;
  String iconRes;

  ItemInfo({this.titleId, this.iconRes});
}
