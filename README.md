# 绿色出行
Flutter 仿滴滴出行App  
地图：采用高德地图，仅简单完成了部分功能，基础地图，地址检索，逆地理编码。  
界面：仿滴滴主界面，地图中心请求动效果，服务tabs展开效果，地址检索界面，城市列表界面。  
项目结构：详见作者另外一个Flutter完整项目[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)。🔥🔥🔥  
目前本项目仅部分开源～  
已开源内容：  
1、Dart汉字转拼音库 [lpinyin](https://github.com/flutterchina/lpinyin)  
2、城市列表，索引&悬停效果 [AzListView](https://github.com/flutterchina/azlistview)  
3、也许是目前最好用的Sp工具类 [SpUtil](https://github.com/Sky24n/flustars)  
4、也许是目前最好用的屏幕工具类 [ScreenUtil](https://github.com/Sky24n/flustars)  
5、国际化 [fluintl](https://github.com/Sky24n/fluintl)  
6、Dart常用工具类库 [common_utils](https://github.com/Sky24n/common_utils)

### lpinyin
```dart
import 'package:lpinyin/lpinyin.dart';
  
String pinyin = PinyinHelper.getPinyin("成都市");
```

### AzListView
```dart
import 'package:azlistview/azlistview.dart';
  
AzListView(
      {Key key,
      this.data,
      this.topData,
      this.itemBuilder,
      this.suspensionWidget,
      this.isUseRealIndex: true,
      this.itemHeight: 50,
      this.suspensionHeight: 40,
      this.onSusTagChanged,
      this.header,
      this.indexBarBuilder,
      this.indexHintBuilder,
      this.showIndexHint: true});  
```

### SpUtil  
详细使用请参考仓库说明。
```dart
import 'package:flustars/flustars.dart';  
  
// App启动时读取Sp数据，需要异步等待Sp初始化完成。
await SpUtil.getInstance();

SpUtil.getString('key', defValue: '');
SpUtil.getInt('key', defValue: 0);
  
/// save object example.
/// 存储实体对象示例。
City city = new City();
city.name = "成都市";
SpUtil.putObject("loc_city", city);
  
Map dataStr = SpUtil.getObject("loc_city");
City hisCity = dataStr == null ? null : City.fromJson(dataStr);
print("thll Str: " + (hisCity == null ? "null" : hisCity.toString()));
  
/// save object list example.
/// 存储实体对象List示例。
List<City> list = new List();
list.add(new City(name: "成都市"));
list.add(new City(name: "北京市"));
SpUtil.putObjectList("loc_city_list", list);
  
List<Map> dataList = SpUtil.getObjectList("loc_city_list");
List<City> _cityList = dataList?.map((value) {
  return City.fromJson(value);
})?.toList();

print("thll List: " + (_cityList == null ? "null" : _cityList.toString()));    
```
  
### ScreenUtil  
详细使用请参考仓库说明。
```dart
import 'package:flustars/flustars.dart';  
  
// 如果设计稿尺寸默认配置一致，无需该设置。  配置设计稿尺寸 默认 360.0 / 640.0 / 3.0  
setDesignWHD(_designW,_designH,_designD);  

// 不依赖context  
// 屏幕宽  
double screenWidth = ScreenUtil.getInstance().screenWidth;  
// 根据屏幕宽适配后尺寸  
double adapterW100 = ScreenUtil.getInstance().getWidth(100);  

// 依赖context  
// 屏幕宽  
double screenWidth = ScreenUtil.getScreenW(context);  
// 根据屏幕宽适配后尺寸  
double adapterW100 = ScreenUtil.getScaleW(context, 100);  
```

### fluintl  
详细使用请参考仓库说明。
```dart
import 'package:fluintl/fluintl.dart';  
  
/// 替换字符串格式要求：'%\${index}\$s' ，{index} 第几个参数，从0开始。

Ids.click_times: '%\$0\$s点击了%\$1\$s次';   
   
IntlUtil.getString(context, Ids.click_times, params: ['Tom', '$_counter']);  
/// print: Tom点击了0次

/// 字符串获取
IntlUtil.getString(context, Ids.titleHome);
IntlUtil.getString(context, Ids.titleHome, params: [param1, param2]);　
CustomLocalizations.of(context).getString(Ids.titleHome);
```

## Screenshot
### 引导页
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/guide.gif" width="240">  
   
### 启动页
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/splash.gif" width="240">   

### 主界面
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/home.gif" width="240">   

### 首页地图
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/home_map.gif" width="240">   

### 地址检索
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/select_location.gif" width="240">   

### 城市列表
<img src="https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppImgs/green_travel/citylist.gif" width="240">   

### 关于App
GitHub : [GreenTravel](https://github.com/Sky24n/GreenTravel)  
仅支持安卓Apk下载  
APK点击下载：[绿色出行v0.0.2](https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/green_travel_a.apk)  
APK扫码下载:   
![通道二](https://user-gold-cdn.xitu.io/2019/2/20/1690a0ced26b695e?w=360&h=360&f=png&s=20552)  

### 关于作者
简书 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://github.com/Sky24n)  
掘金 &nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://github.com/Sky24n)  
Pub &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: [Sky24n](https://pub.flutter-io.cn/packages?q=email%3A863764940%40qq.com)    
Email &nbsp;&nbsp;: 863764940@qq.com  
GitHub : [Sky24n](https://github.com/Sky24n)  
  
[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)&nbsp; [![GitHub stars](https://img.shields.io/github/stars/Sky24n/flutter_wanandroid.svg?style=social&label=Star)](https://github.com/Sky24n/flutter_wanandroid) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/flutter_wanandroid.svg?style=social&label=Fork)](https://github.com/Sky24n/flutter_wanandroid) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/flutter_wanandroid.svg?style=social&label=Watch)](https://github.com/Sky24n/flutter_wanandroid)  
[GreenTravel](https://github.com/Sky24n/GreenTravel)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/Sky24n/GreenTravel.svg?style=social&label=Star)](https://github.com/Sky24n/GreenTravel) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/GreenTravel.svg?style=social&label=Fork)](https://github.com/Sky24n/GreenTravel) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/GreenTravel.svg?style=social&label=Watch)](https://github.com/Sky24n/GreenTravel)  
[flustars](https://github.com/Sky24n/flustars)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/Sky24n/flustars.svg?style=social&label=Star)](https://github.com/Sky24n/flustars) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/flustars.svg?style=social&label=Fork)](https://github.com/Sky24n/flustars) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/flustars.svg?style=social&label=Watch)](https://github.com/Sky24n/flustars)  
[common_utils](https://github.com/Sky24n/common_utils)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/Sky24n/common_utils.svg?style=social&label=Star)](https://github.com/Sky24n/common_utils) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/common_utils.svg?style=social&label=Fork)](https://github.com/Sky24n/common_utils) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/common_utils.svg?style=social&label=Watch)](https://github.com/Sky24n/common_utils)  
[azlistview](https://github.com/flutterchina/azlistview)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/flutterchina/azlistview.svg?style=social&label=Star)](https://github.com/flutterchina/azlistview) [![GitHub forks](https://img.shields.io/github/forks/flutterchina/azlistview.svg?style=social&label=Fork)](https://github.com/flutterchina/azlistview) [![GitHub watchers](https://img.shields.io/github/watchers/flutterchina/azlistview.svg?style=social&label=Watch)](https://github.com/flutterchina/azlistview)  
[lpinyin](https://github.com/flutterchina/lpinyin)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/flutterchina/lpinyin.svg?style=social&label=Star)](https://github.com/flutterchina/lpinyin) [![GitHub forks](https://img.shields.io/github/forks/flutterchina/lpinyin.svg?style=social&label=Fork)](https://github.com/flutterchina/lpinyin) [![GitHub watchers](https://img.shields.io/github/watchers/flutterchina/lpinyin.svg?style=social&label=Watch)](https://github.com/flutterchina/lpinyin)  
[fluintl](https://github.com/Sky24n/fluintl)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [![GitHub stars](https://img.shields.io/github/stars/Sky24n/fluintl.svg?style=social&label=Star)](https://github.com/Sky24n/fluintl) [![GitHub forks](https://img.shields.io/github/forks/Sky24n/fluintl.svg?style=social&label=Fork)](https://github.com/Sky24n/fluintl) [![GitHub watchers](https://img.shields.io/github/watchers/Sky24n/fluintl.svg?style=social&label=Watch)](https://github.com/Sky24n/fluintl)  

