import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  String serverUrl;
  String websocketUrl;
  late String fromuid;
  GlobalState(this.serverUrl, this.websocketUrl);

  void setFromuid(String uid) {
    fromuid = uid;
  }
}