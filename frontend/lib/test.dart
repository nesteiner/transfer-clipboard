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
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final left = SizedBox(
      width: size.width * 0.4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red
        ),
      ),
    );

    final right = SizedBox(
      width: size.width * 0.6,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
      ),
    );

    final child = FractionallySizedBox(
      widthFactor: 0.9,
      child: Row(
        children: [
          left,
          Expanded(child: right)
        ],
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: child,
    );
  }
}