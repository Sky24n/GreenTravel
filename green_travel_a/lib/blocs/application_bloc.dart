import 'package:green_travel_a/blocs/bloc_provider.dart';
import 'package:green_travel_a/event/event.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  BehaviorSubject<ComEvent> _appEvent = BehaviorSubject<ComEvent>();

  Sink<ComEvent> get _appEventSink => _appEvent.sink;

  Stream<ComEvent> get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    _appEvent.close();
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

  void sendAppEvent(ComEvent event) {
    _appEventSink.add(event);
  }
}
