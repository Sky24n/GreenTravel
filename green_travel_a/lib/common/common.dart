class Constant {
  static const int status_success = 0;
  static const String server_address = wan_android;
  static const String wan_android = "http://www.wanandroid.com/";

  static const String key_guide_images = 'key_guide_images';
  static const String key_splash_model = 'key_splash_model';
  static const String key_language = 'key_language';
}

class AppConfig {
  static const String appName = 'green_travel_a';
  static const String version = '0.0.2';
  static const bool isDebug = false;
}

class ServiceType {
  static const int fast_car = 1; //快车
  static const int minibus = 2; //小巴
  static const int bus = 3; //公交
  static const int bicycle = 4; //单车
  static const int special_car = 5; //专车
  static const int taxi = 6; //出租车
  static const int driving = 7; //代驾
  static const int car_rental = 8; //自驾租车
  static const int tailwind_car = 9; //顺风车
}

class EventIds {
  static const int home = 0;
  static const int main_page_city = 3;
}
