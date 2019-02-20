import 'dart:collection';

import 'package:common_utils/common_utils.dart';
import 'package:green_travel_a/blocs/bloc_provider.dart';
import 'package:green_travel_a/models/models.dart';
import 'package:green_travel_a/utils/http_utils.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BlocBase {
  ///****** ****** ****** Version ****** ****** ****** /

  BehaviorSubject<VersionModel> _version = BehaviorSubject<VersionModel>();

  Sink<VersionModel> get _versionSink => _version.sink;

  Stream<VersionModel> get versionStream => _version.stream.asBroadcastStream();

  VersionModel _versionModel;

  ///****** ****** ****** Version ****** ****** ****** /

  ///****** ****** ****** personal ****** ****** ****** /
  HttpUtils httpUtils = new HttpUtils();

  MainBloc() {
    LogUtil.e("MainBloc......");
  }

  @override
  Future getData({String labelId, int page}) {
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return null;
  }

  Future getVersion() async {
    httpUtils.getVersion().then((model) {
      _versionModel = model;
      _versionSink.add(_versionModel);
    });
  }

  @override
  void dispose() {
    _version.close();
  }
}
