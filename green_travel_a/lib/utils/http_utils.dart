import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:green_travel_a/common/common.dart';
import 'package:green_travel_a/common/sp_helper.dart';
import 'package:green_travel_a/models/models.dart';
import 'package:green_travel_a/utils/index.dart';

//模拟网络请求数据
class HttpUtils {
  Future<SplashModel> getSplash() {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new SplashModel(
        title: 'Flutter 常用工具类库',
        content: 'Flutter 常用工具类库',
        url: 'https://www.jianshu.com/p/425a7ff9d66e',
        imgUrl:
            'https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/flutter_common_utils_a.png',
      );
    });
  }

  Future<VersionModel> getVersion() async {
    return Future.delayed(new Duration(milliseconds: 300), () {
      return new VersionModel(
        title: '有新版本v0.0.2，去更新吧！',
        content: '',
        url:
            'https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/green_trip_a.apk',
        version: AppConfig.version,
      );
    });
  }
}
