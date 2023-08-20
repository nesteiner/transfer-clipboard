import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final messenger = ScaffoldMessenger.of(context);
        const snackbar = SnackBar(content: Text("Hello World"), duration: const Duration(seconds: 100,));
        messenger.showSnackBar(snackbar);

        messenger.hideCurrentSnackBar();
      },

      child: const Text("click me"),
    );
  }
}