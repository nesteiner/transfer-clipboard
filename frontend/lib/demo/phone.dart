import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "copy image",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("copy file"),),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () async {
              try {
                final directory = await getTemporaryDirectory();
                final path = join(directory.path, "tempfile");
                const url = "http://192.168.1.6:8082/api/download/image/hello";
                await dio.download(url, path);
                Pasteboard.writeFiles([path]);

                final text = "ok ${await Pasteboard.files()}";
                await showDialog(context: context, builder: (_) => AlertDialog(
                  content: const Text("copy ok"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(_).pop();
                      },

                      child: Text(text),
                    )
                  ],
                ));
              } on Exception catch (exception) {
                await showDialog(context: context, builder: (context) => AlertDialog(
                  content: Text("fuck: ${exception}"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },

                      child: const Text("ok"),
                    )
                  ],
                ));
              }


            },

            child: const Text("copy image"),
          )
        ],
      ),
    );
  }
}