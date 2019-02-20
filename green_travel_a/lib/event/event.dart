import 'package:flutter/widgets.dart';
import 'package:green_travel_a/blocs/index.dart';

class StatusEvent {
  String labelId;
  int status;
  int cid;

  StatusEvent(this.labelId, this.status, {this.cid});
}

class ComEvent {
  int id;
  Object data;

  ComEvent({
    this.id,
    this.data,
  });
}

class Event {
  static void sendAppEvent(BuildContext context, ComEvent event) {
    BlocProvider.of<ApplicationBloc>(context).sendAppEvent(event);
  }
}
