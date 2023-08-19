import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<int> nums = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: buildBody(context)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            nums.insert(0, 10);
          });
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: nums.map((e) => Text(e.toString())).toList(),
    );
  }
}