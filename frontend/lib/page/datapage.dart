import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;
import 'package:frontend/protobuf/.proto.pbenum.dart';
import 'package:frontend/state.dart';
import 'package:frontend/widget/filecard.dart';
import 'package:frontend/widget/imagecard.dart';
import 'package:frontend/widget/textcard.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class DataPage extends StatefulWidget {
  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  late List<protobuf.Text> texts;
  late List<protobuf.Image> images;
  late List<protobuf.File> files;
  late String serverUrl;
  late String touid;
  final Dio dio = Dio();
  final Options options = Options(
    responseType: ResponseType.bytes,
    headers: {
      "Accept": "application/x-protobuf"
    }
  );

  @override
  Widget build(BuildContext context) {

    socket?.stream.listen((event) {
      final data = event.cast<protobuf.TransferData>() as protobuf.TransferData;
      if (data.type == TransferData_DataType.ERROR) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("error occurs"),
            content: Text(data.error),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },

                child: const Text("OK"),
              )
            ],
          )
        );
      } else if (data.type == TransferData_DataType.MESSAGE) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("there is a message from server"),
              content: Text(data.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },

                  child: const Text("OK"),
                )
              ],
            )
        );
      } else if (data.type == TransferData_DataType.TEXT) {
         showDialog(
           context: context,
           builder: (context) => AlertDialog(
             content: Text("there is text data from ${data.fromuid}, do you accept it?"),
             actions: [
               TextButton(
                 onPressed: () {
                   Navigator.of(context).pop();
                 },

                 child: const Text("Cancel"),
               ),

               TextButton(
                 onPressed: () {
                   onPressCopyText(data.text);
                 },

                 child: const Text("Ok"),
               )
             ],
           )
         );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("there is image or file data from ${data.fromuid}, do you accept it?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },

                child: const Text("Cancel"),
              ),

              TextButton(
                onPressed: () async {
                  if (data.type == TransferData_DataType.IMAGE) {
                    await onPressCopyImage(serverUrl, data.image);
                  } else {
                    await onPressCopyFile(serverUrl, data.file);
                  }
                },

                child: const Text("Ok"),
              )
            ],
          )
        );
      }
    });


    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "text",),
                Tab(text: "image"),
                Tab(text: "file")
              ],
            ),
          ),

          body: TabBarView(
            children: [
              buildTexts(context),
              buildImages(context),
              buildFiles(context)
            ],
          ),
        )
    );
  }

  Widget buildTexts(BuildContext context) {
    final state = context.read<GlobalState>();
    final serverUrl = state.serverUrl;

    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/text"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          final column = Column(
            children: data.texts.list
                .map(
                    (text) => buildTextCard(
                      context,
                      text,
                      onPressCopy: () {
                        onPressCopyText(text);
                      },
                      onPressShare: () {
                        onPressShareText(context, text);
                      },

                      onPressDelete: () async {
                        await onPressDelete(serverUrl, "text", text.id);
                      }
                    ),
            ).toList(),
          );

          return SingleChildScrollView(
            child: column,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildImages(BuildContext context) {
    final state = context.read<GlobalState>();
    final serverUrl = state.serverUrl;

    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/image"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          final column = Column(
            children: data.images.list.map(
                    (image) => buildImageCard(
                      context,
                      image,
                      onPressCopy: () async {
                        await onPressCopyImage(serverUrl, image);
                      },

                      onPressShare: () {
                        onPressShareImage(context, image);
                      },

                      onPressDelete: () async {
                        await onPressDelete(serverUrl, "image", image.id);
                      }
                    )).toList(),
          );

          return SingleChildScrollView(
            child: column,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildFiles(BuildContext context) {
    final state = context.read<GlobalState>();
    final serverUrl = state.serverUrl;

    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/file"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          final column = Column(
            children: data.files.list
                .map(
                    (file) => buildFileCard(
                        context,
                        file,
                        onPressCopy: () async {
                          await onPressCopyFile(serverUrl, file);
                        },

                      onPressShare: () {
                        onPressShareFile(context, file);
                      },

                      onPressDelete: () async {
                        await onPressDelete(serverUrl, "image", file.id);
                      }
                )).toList(),
          );

          return SingleChildScrollView(
            child: column,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void onPressCopyText(protobuf.Text text) {
    Pasteboard.writeText(text.text);
  }

  Future<void> onPressCopyImage(String serverUrl, protobuf.Image image) async {
    final directory = await getApplicationCacheDirectory();
    final path = join(directory.path, "tempimage");
    final url = join(serverUrl, "api/download/image", image.name);
    await dio.download(url, path);
    await Pasteboard.writeFiles([path]);
  }

  Future<void> onPressCopyFile(String serverUrl, protobuf.File file) async {
    final directory = await getApplicationCacheDirectory();
    final path = join(directory.path, "tempfile");
    final url = join(serverUrl, "api/download/file", file.name);
    await dio.download(url, path);
    await Pasteboard.writeFiles([path]);
  }

  void onPressShareText(BuildContext context, protobuf.Text text) {
    final futurebuilder = FutureBuilder(
      future: findOnlineUsers(),
      builder: (context, snapshot) {
        final users = snapshot.requireData.users;
        users.insert(0, "select user");
        final menus = users.map((user) => DropdownMenuItem(
          child: Text(user),
          value: user,
        )).toList();
         return DropdownButton(
             value: "select user",
             items: menus,
             onChanged: (String? value) {
               if (value != null) {
                 touid = value;
               }
             }
        );
      },
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("select user and send"),
        content: futurebuilder,
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },

            child: const Text("cancel"),
          ),

          TextButton(
            onPressed: () {
              final state = context.read<GlobalState>();
              if (touid == "select user") {
                final snackbar = SnackBar(content: const Text("no user select"));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              } else {
                final data = protobuf.TransferData.create();
                data.fromuid = state.fromuid;
                data.touid = touid;
                data.type = TransferData_DataType.TEXT;
                data.text = text;
                socket?.sink.add(data.writeToBuffer());
                Navigator.of(context).pop();
              }
            },

            child: const Text("send"),
          )
        ],
      )
    );
  }

  void onPressShareImage(BuildContext context, protobuf.Image image) {
    final futurebuilder = FutureBuilder(
      future: findOnlineUsers(),
      builder: (context, snapshot) {
        final users = snapshot.requireData.users;
        users.insert(0, "select user");
        final menus = users.map((user) => DropdownMenuItem(
          child: Text(user),
          value: user,
        )).toList();
        return DropdownButton(
            value: "select user",
            items: menus,
            onChanged: (String? value) {
              if (value != null) {
                touid = value;
              }
            }
        );
      },
    );

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("select user and send"),
          content: futurebuilder,
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },

              child: const Text("cancel"),
            ),

            TextButton(
              onPressed: () {
                final state = context.read<GlobalState>();
                if (touid == "select user") {
                  final snackbar = SnackBar(content: const Text("no user select"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else {
                  final data = protobuf.TransferData.create();
                  data.fromuid = state.fromuid;
                  data.touid = touid;
                  data.type = TransferData_DataType.IMAGE;
                  data.image = image;
                  socket?.sink.add(data.writeToBuffer());
                  Navigator.of(context).pop();
                }
              },

              child: const Text("send"),
            )
          ],
        )
    );
  }

  void onPressShareFile(BuildContext context,protobuf.File file) {
    final futurebuilder = FutureBuilder(
      future: findOnlineUsers(),
      builder: (context, snapshot) {
        final users = snapshot.requireData.users;
        users.insert(0, "select user");
        final menus = users.map((user) => DropdownMenuItem(
          child: Text(user),
          value: user,
        )).toList();
        return DropdownButton(
            value: "select user",
            items: menus,
            onChanged: (String? value) {
              if (value != null) {
                touid = value;
              }
            }
        );
      },
    );

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("select user and send"),
          content: futurebuilder,
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },

              child: const Text("cancel"),
            ),

            TextButton(
              onPressed: () {
                final state = context.read<GlobalState>();
                if (touid == "select user") {
                  final snackbar = SnackBar(content: const Text("no user select"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else {
                  final data = protobuf.TransferData.create();
                  data.fromuid = state.fromuid;
                  data.touid = touid;
                  data.type = TransferData_DataType.FILE;
                  data.file = file;
                  socket?.sink.add(data.writeToBuffer());
                  Navigator.of(context).pop();
                }
              },

              child: const Text("send"),
            )
          ],
        )
    );
  }

  Future<void> onPressDelete(String serverUrl, String type, int id) async {
    String? url = null;
    if (type == "text") {
      url = join(serverUrl, "api/text", id.toString());
      setState(() {
        texts.removeWhere((element) => element.id == id);
      });
    } else if (type == "image") {
      url = join(serverUrl, "api/image", id.toString());
      setState(() {
        images.removeWhere((element) => element.id == id);
      });
    } else if (type == "file") {
      url = join(serverUrl, "api/file", id.toString());
      setState(() {
        files.removeWhere((element) => element.id == id);
      });
    }

    await dio.delete(url!);
  }

  Future<protobuf.OnlineUsers> findOnlineUsers() async {
    final response = await dio.get(join(serverUrl, "api/clipboard/user"));
    final data = protobuf.OnlineUsers.fromBuffer(response.data);
    return data;
  }
}