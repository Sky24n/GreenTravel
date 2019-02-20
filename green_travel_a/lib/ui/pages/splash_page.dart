import 'package:flutter/material.dart';
import 'package:green_travel_a/common/component_index.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;

  List<String> _guideList = [
    Utils.getImgPath('guide1'),
    Utils.getImgPath('guide2'),
    Utils.getImgPath('guide3'),
    Utils.getImgPath('guide4'),
  ];
  List<String> _guideInfoList = [
    "在你需要的每个地方",
    "载你去往每个地方",
    "懂你，更懂你所行",
    "因为在意，所以用心",
  ];

  List<Widget> _bannerList = new List();

  int _status = 0;
  int _count = 3;

  SplashModel _splashModel;

  @override
  void initState() {
    super.initState();
    _loadSplashData();
    _initAsync();
  }

  void _loadSplashData() async {
    await SpUtil.getInstance();
    _splashModel = SpHelper.getSplashModel();
    if (_splashModel != null) {
      setState(() {});
    }
    HttpUtils httpUtil = new HttpUtils();
    httpUtil.getSplash().then((model) {
      if (!ObjectUtil.isEmpty(model.imgUrl)) {
        if (_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
          SpHelper.putObject(Constant.key_splash_model, model);
          setState(() {
            _splashModel = model;
          });
        }
      } else {
        SpHelper.putObject(Constant.key_splash_model, null);
      }
    });
  }

  void _initAsync() {
    Observable.just(1).delay(new Duration(milliseconds: 500)).listen((_) {
      //SpUtil.putBool(Constant.key_guide_images, false);
      if (SpUtil.getBool(Constant.key_guide_images) != true &&
          ObjectUtil.isNotEmpty(_guideList)) {
        _initBanner();
      } else {
        _initSplash();
      }
    });
  }

  void _initSplash() {
    _splashModel = SpHelper.getSplashModel();
    if (_splashModel == null) {
      _goMain();
    } else {
      _doCountDown();
    }
  }

  void _doCountDown() {
    setState(() {
      _status = 1;
    });
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            new Center(
              child: new Text(
                _guideInfoList[i],
                style: new TextStyle(
                    fontSize: Dimens.font_sp20, color: Colors.white),
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: new InkWell(
                  onTap: () {
                    SpUtil.putBool(Constant.key_guide_images, true);
                    _goMain();
                  },
                  child: new Container(
                    width: 185,
                    alignment: Alignment.center,
                    height: Dimens.btn_h_48,
                    child: new Text(
                      '立即启程',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: Dimens.font_sp14),
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        color: Colours.white_19,
                        border: new Border.all(
                            width: Dimens.border_width, color: Colors.white70)),
                  ),
                ),
              ),
            ),
          ],
        ));
      } else {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            new Center(
              child: new Text(
                _guideInfoList[i],
                style: new TextStyle(
                    fontSize: Dimens.font_sp20, color: Colors.white),
              ),
            )
          ],
        ));
      }
    }
  }

  Widget _buildBanner() {
    return new Offstage(
      offstage: !(_status == 2),
      child: ObjectUtil.isEmpty(_bannerList)
          ? new Container()
          : new Swiper(
              autoStart: false,
              circular: false,
              indicator: CircleSwiperIndicator(
                  radius: 2,
                  spacing: 4,
                  padding: EdgeInsets.only(bottom: 32.0),
                  itemColor: Colors.white,
                  itemActiveColor: Colours.app_main),
              children: _bannerList),
    );
  }

  Widget _buildAdWidget() {
    if (_splashModel == null) {
      return new Container();
    }
    return new Offstage(
      offstage: !(_status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url)) return;
          _goMain();
          NavigatorUtil.pushWeb(context,
              title: _splashModel.title, url: _splashModel.url);
        },
        child: new Container(
          alignment: Alignment.center,
          child: new CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: _splashModel.imgUrl,
          ),
        ),
      ),
    );
  }

  Widget _buildSplash() {
    return new Offstage(
      offstage: !(_status != 2),
      child: new Align(
        alignment: Alignment.bottomCenter,
        child: new Container(
          height: 90,
          color: Colors.white,
          child: new Stack(
            children: <Widget>[
              new Center(
                child: Image.asset(
                  Utils.getImgPath(Ids.icon_splash_logo),
                  width: 120,
                  height: 90,
                  //fit: BoxFit.cover,
                ),
              ),
              _buildCountDown()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountDown() {
    return new Offstage(
      offstage: !(_status == 1),
      child: new Align(
        alignment: Alignment.bottomRight,
        child: new InkWell(
          onTap: () {
            _goMain();
          },
          child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(12),
            child: new RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(children: <TextSpan>[
                new TextSpan(
                    style: new TextStyle(fontSize: 14, color: Colors.orange),
                    text: "$_count"),
                new TextSpan(
                    style:
                        new TextStyle(fontSize: 12, color: Colours.text_normal),
                    text: " 跳过")
              ]),
            ),
            height: 30,
            width: 60,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: new Border.all(
                    width: Dimens.border_width, color: Colours.gray_cc)),
          ),
        ),
      ),
    );
  }

  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/MainPage');
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          _buildBanner(),
          _buildAdWidget(),
          _buildSplash(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }
}
