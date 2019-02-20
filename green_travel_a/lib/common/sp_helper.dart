import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:green_travel_a/common/common.dart';
import 'package:green_travel_a/models/models.dart';

class SpHelper {
  // T 用于区分存储类型
  static void putObject(String key, Object value) {
    SpUtil.putString(key, value == null ? "" : json.encode(value));
  }

  static LanguageModel getLanguageModel() {
    String _saveLanguage = SpUtil.getString(Constant.key_language);
    if (ObjectUtil.isNotEmpty(_saveLanguage)) {
      Map userMap = json.decode(_saveLanguage);
      return LanguageModel.fromJson(userMap);
    }
    return null;
  }

  static SplashModel getSplashModel() {
    String _splashModel = SpUtil.getString(Constant.key_splash_model);
    if (ObjectUtil.isNotEmpty(_splashModel)) {
      Map userMap = json.decode(_splashModel);
      return SplashModel.fromJson(userMap);
    }
    return null;
  }
}
