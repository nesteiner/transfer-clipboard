import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "clipboard",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("hello clipboard")),
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
            onPressed: () {
              Pasteboard.writeText("fuck you");
            },

            child: const Text("copy text to clipboard"),
          ),

          OutlinedButton(
            onPressed: () async {
              // final imagefile = File("/home/steiner/disk/windows-data/Download/私を染めるiの歌_109951167807493772.jpg");
              // final bytes = await imagefile.readAsBytes();
              // await Pasteboard.writeImage(bytes);
              //
              // final imagebytes = await Pasteboard.image;
              // print(imagebytes?.length);

              final paths = ["http://localhost:8082/api/download/image/hello"];
              await Pasteboard.writeFiles(paths);
              print(await Pasteboard.files());
            },

            child: const Text("copy image to clipboard"),
          ),

          OutlinedButton(
            onPressed: () async {
              final paths = ["http://localhost:8082/api/download/file/hello"];
              await Pasteboard.writeFiles(paths);
              print(await Pasteboard.files());
            },

            child: const Text("copy file to clipboard"),
          ),

          OutlinedButton(
            onPressed: () async {
              final paths = ["/home/steiner/disk/windows-data/Download/私を染めるiの歌_109951167807493772.jpg"];
              await Pasteboard.writeFiles(paths);

              print(await Pasteboard.files());
            },

            child: const Text("copy file from local machine"),
          ),

          OutlinedButton(
            onPressed: () async {
              // final path = "http://localhost:8082/api/download/image/hello";
              final path = "file:///home/steiner/disk/windows-data/Download/cake/[MFStar] VOL.013 娇艳小萝莉徐cake性感私房第二套高清写真美图录/1.jpg";
              final data = ClipboardData(text: path);
              Clipboard.setData(data);
            },

            child: const Text("using content://"),
          ),

          OutlinedButton(
            onPressed: () async {
              final data = await Clipboard.getData(Clipboard.kTextPlain);
              print(data?.text);
            },
            child: const Text("print clipboard data"),
          ),

          OutlinedButton(
            onPressed: () async {
              final dio = Dio();
              final url = "https://i1.wp.com/0816a3.3tp.club/uploadfile/202306/1/C9162340495.jpg";
              final directory = await getTemporaryDirectory();
              final path = join(directory.path, "tempfile");
              await dio.download(url, path);
              Pasteboard.writeFiles([path]);
            },

            child: const Text("copy data from network"),
          )
        ],
      ),
    );
  }
}