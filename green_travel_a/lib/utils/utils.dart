import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:green_travel_a/common/common.dart';
import 'package:green_travel_a/common/sp_helper.dart';
import 'package:green_travel_a/models/models.dart';
import 'package:green_travel_a/res/index.dart';
import 'package:lpinyin/lpinyin.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/3.0x/$name.$format';
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
    return TimelineUtil.format(timeMillis,
        locale: Localizations.localeOf(context).languageCode,
        dayFormat: DayFormat.Common);
  }

  /// 0
  /// -1
  /// 1
  static int getUpdateStatus(String version) {
    String locVersion = AppConfig.version;
    int remote = int.tryParse(version.replaceAll('.', ''));
    int loc = int.tryParse(locVersion.replaceAll('.', ''));
    if (remote <= loc) {
      return 0;
    } else {
      return (remote - loc >= 2) ? -1 : 1;
    }
  }

  static String getString(Object str) {
    return str == null ? "" : str.toString();
  }

  static List<ServiceModel> getAllServices() {
    final list = <ServiceModel>[
      ServiceModel(
        tabId: ServiceType.fast_car,
        labelId: Ids.fast_car,
      ),
      ServiceModel(
        tabId: ServiceType.minibus,
        labelId: Ids.minibus,
      ),
      ServiceModel(
        tabId: ServiceType.bus,
        labelId: Ids.bus,
      ),
      ServiceModel(
        tabId: ServiceType.bicycle,
        labelId: Ids.bicycle,
      ),
      ServiceModel(
        tabId: ServiceType.special_car,
        labelId: Ids.special_car,
      ),
      ServiceModel(
        tabId: ServiceType.taxi,
        labelId: Ids.taxi,
      ),
      ServiceModel(
        tabId: ServiceType.driving,
        labelId: Ids.driving,
      ),
      ServiceModel(
        tabId: ServiceType.car_rental,
        labelId: Ids.car_rental,
      ),
      ServiceModel(
        tabId: ServiceType.tailwind_car,
        labelId: Ids.tailwind_car,
      )
    ];

    return list;
  }
}
