import 'package:flutter/material.dart';
import 'package:frontend/page/startpage.dart';
import 'package:frontend/state.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

IOWebSocketChannel? socket;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: MaterialApp(
        title: "transfer-clipboard",
        home: StartPage(),
      ),
    );
  }
}