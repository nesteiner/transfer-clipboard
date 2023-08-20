import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
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
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DataPage extends StatefulWidget {
  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  static String DEFAULT_TO_UID = "Select User";

  late List<protobuf.Text> texts;
  late List<protobuf.Image> images;
  late List<protobuf.File> files;
  late String serverUrl;
  String touid = DEFAULT_TO_UID;
  late String fromuid;
  final Dio dio = Dio();
  final Options options = Options(
    responseType: ResponseType.bytes,
    headers: {
      "Accept": "application/x-protobuf"
    }
  );

  // for add
  TextEditingController controller = TextEditingController();
  // for update state
  late void Function(void Function()) setStateTexts;
  late void Function(void Function()) setStateImages;
  late void Function(void Function()) setStateFiles;

  // for get tab controller index
  late BuildContext controllerContext;
  @override
  Widget build(BuildContext context) {
    final state = context.read<GlobalState>();
    serverUrl = state.serverUrl;
    fromuid = state.fromuid;
    // TODO debug, later to delete this isinit

    socket?.stream.listen((event) async {
      await listenFunction(context, event);
    }, onError: (error) {
      onError(context, error);
    }, onDone: () {
      onDone(context);
    });

    final child = Builder(builder: (childContext) {
      controllerContext = childContext;
      return Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "text",),
              Tab(text: "image"),
              Tab(text: "file")
            ],
          ),

          actions: [
            IconButton(
              onPressed: () {
                onDone(context);
              },

              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),

        body: TabBarView(
          children: [
            buildTexts(childContext),
            buildImages(childContext),
            buildFiles(childContext)
          ],
        ),

        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: "refresh",
              onPressed: () async {
                final index = await onPressRefresh(childContext);
                if (index == 0) {
                  setStateTexts(() {

                  });
                } else if (index == 1) {
                  setStateImages(() {

                  });
                } else {
                  setStateFiles(() {

                  });
                }
              },

              child: const Icon(Icons.refresh),
            ),

            const SizedBox(height: 10,),

            FloatingActionButton(
              heroTag: "add",
              onPressed: () {
                onPressAdd(childContext);
              },

              child: const Icon(Icons.add),
            )
          ],
        )
      );
    },);

    return DefaultTabController(
        length: 3,
        child: child
    );
  }

  Widget buildTexts(BuildContext context) {
    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/text"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          texts = data.texts.list.reversed.toList();

          return StatefulBuilder(builder: (context, setState) {
            setStateTexts = setState;
            final column = Column(
                children: texts
                    .map(
                      (text) =>
                      buildTextCard(
                          context,
                          text,
                          onPressCopy: () {
                            onPressCopyText(text);
                          },
                          onPressShare: () {
                            onPressShareText(context, text);
                          },

                          onPressDelete: () async {
                            await onPressDelete(serverUrl, "text", text.id.toString());
                          }
                      ),
                ).toList(),
            );

            return SingleChildScrollView(
              child: column,
            );
          });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildImages(BuildContext context) {
    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/image"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          images = data.images.list.reversed.toList();

          return StatefulBuilder(builder: (context, setState) {
            setStateImages = setState;
            final column = Column(
              children: images.map(
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
                            await onPressDelete(serverUrl, "image", image.name);
                          }
                  )).toList(),
            );

            return SingleChildScrollView(
              child: column,
            );
          });

        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildFiles(BuildContext context) {
    return FutureBuilder(
      future: dio.get(join(serverUrl, "api", "clipboard/file"), options: options),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = protobuf.TransferQueryAllResponse.fromBuffer(snapshot.requireData.data);
          files = data.files.list.reversed.toList();

          return StatefulBuilder(builder: (context, setState) {
            setStateFiles = setState;
            final column = Column(
              children: files
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
                            await onPressDelete(serverUrl, "file", file.name);
                          }
                      )).toList(),
            );

            return SingleChildScrollView(
              child: column,
            );
          });

        } else {
          return const Center(
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
    final url = join(serverUrl, "api/download/image", image.name);

    if (!Platform.isAndroid && !Platform.isIOS) {
      final directory = await getApplicationCacheDirectory();
      String path = join(directory.path, "tempimage");
      if (Platform.isWindows) {
        final subfix = image.name.split(".").lastOrNull;
        if (subfix != null) {
          path = join(directory.path, "tempimage.$subfix");
        }
      }
      await dio.download(url, path);
      await Pasteboard.writeFiles([path]);
    } else {
      final directory = await FilePicker.platform.getDirectoryPath();
      if (directory != null) {
        final path = join(directory, image.name);
        final flag = await Permission.storage.isDenied;
        bool result = false;
        if (!flag) {
          result = await Permission.storage.request().isGranted;
        }

        if (result) {
          await dio.download(url, path);
        }
      }
    }
  }

  Future<void> onPressCopyFile(String serverUrl, protobuf.File file) async {
    final url = join(serverUrl, "api/download/file", file.name);

    if (!Platform.isAndroid && !Platform.isIOS) {
      final directory = await getApplicationCacheDirectory();
      String path = join(directory.path, "tempfile");
      if (Platform.isWindows) {
        final subfix = file.name.split(".").lastOrNull;
        if (subfix != null) {
          path = join(directory.path, "tempimage.$subfix");
        }
      }

      await dio.download(url, path);
      await Pasteboard.writeFiles([path]);
    } else {
      final directory = await FilePicker.platform.getDirectoryPath();
      if (directory != null) {
        final path = join(directory, file.name);

        final flag = await Permission.storage.isDenied;
        bool result = false;
        if (!flag) {
          result = await Permission.storage.request().isGranted;
        }

        if (result) {
          await dio.download(url, path);
        }
      }
    }
  }

  void onPressShareText(BuildContext context, protobuf.Text text) {
    final futurebuilder = FutureBuilder(
      future: findOnlineUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.requireData.users;
          users.insert(0, DEFAULT_TO_UID);
          users.removeWhere((element) => element == fromuid);
          final menus = users.map((user) =>
              DropdownMenuItem(
                value: user,
                child: Text(user),
              )).toList();

          return StatefulBuilder(builder: (context, setState) {
            return DropdownButton(
                value: touid,
                items: menus,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      touid = value;
                    });
                  }
                }
            );
          });

        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
              if (touid == DEFAULT_TO_UID) {
                const snackbar = SnackBar(content: Text("no user select"));
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
        if (snapshot.hasData) {
          final users = snapshot.requireData.users;
          users.insert(0, DEFAULT_TO_UID);
          users.removeWhere((element) => element == fromuid);
          final menus = users.map((user) =>
              DropdownMenuItem(
                value: user,
                child: Text(user),
              )).toList();

          return StatefulBuilder(builder: (context, setState) {
            return DropdownButton(
                value: touid,
                items: menus,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      touid = value;
                    });
                  }
                }
            );
          });

        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                if (touid == DEFAULT_TO_UID) {
                  const snackbar = SnackBar(content: Text("no user select"));
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
        if (snapshot.hasData) {
          final users = snapshot.requireData.users;
          users.insert(0, DEFAULT_TO_UID);
          users.removeWhere((element) => element == fromuid);
          final menus = users.map((user) =>
              DropdownMenuItem(
                value: user,
                child: Text(user),
              )).toList();
          return StatefulBuilder(builder: (context, setState) {
            return DropdownButton(
                value: touid,
                items: menus,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      touid = value;
                    });
                  }
                }
            );
          });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                if (touid == DEFAULT_TO_UID) {
                  const snackbar = SnackBar(content: Text("no user select"));
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

  Future<void> onPressDelete(String serverUrl, String type, String text) async {
    String? url;
    if (type == "text") {
      url = join(serverUrl, "api/clipboard/text", text);
      setStateTexts(() {
        texts.removeWhere((element) => element.id == int.parse(text));
      });
    } else if (type == "image") {
      url = join(serverUrl, "api/clipboard/image", text);
      setStateImages(() {
        images.removeWhere((element) => element.name == text);
      });
    } else if (type == "file") {
      url = join(serverUrl, "api/clipboard/file", text);
      setStateFiles(() {
        files.removeWhere((element) => element.name == text);
      });
    }

    await dio.delete(url!);
  }

  Future<protobuf.OnlineUsers> findOnlineUsers() async {
    final response = await dio.get(join(serverUrl, "api/clipboard/user"), options: options);
    final data = protobuf.OnlineUsers.fromBuffer(response.data);
    return data;
  }

  void onPressAdd(BuildContext context) {
    final controller = DefaultTabController.of(context);
    final index = controller.index;

    if (index == 0) {
      addText(context);
    } else if (index == 1) {
      addImage(context);
    } else {
      addFile(context);
    }
  }

  Future<int> onPressRefresh(BuildContext context) async {
    final controller = DefaultTabController.of(context);
    final index = controller.index;

    if (index == 0) {
      final url = join(serverUrl, "api/clipboard/text");
      final response = await dio.get(url, options: options);
      final data = protobuf.TransferQueryAllResponse.fromBuffer(response.data);

      setStateTexts(() {
        texts = data.texts.list.reversed.toList();
      });

    } else if (index == 1) {
      final url = join(serverUrl, "api/clipboard/image");
      final response = await dio.get(url, options: options);
      final data = protobuf.TransferQueryAllResponse.fromBuffer(response.data);

      setStateImages(() {
        images = data.images.list.reversed.toList();
      });

    } else {
      final url = join(serverUrl, "api/clipboard/file");
      final response = await dio.get(url, options: options);
      final data = protobuf.TransferQueryAllResponse.fromBuffer(response.data);

      setStateFiles(() {
        files = data.files.list.reversed.toList();
      });

    }

    return index;
  }

  void addText(BuildContext context) {
    final textfield = TextField(
      controller: controller,
    );

    final sizedbox = FractionallySizedBox(
      widthFactor: 0.8,
      child: textfield,
    );

    final cancelButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blueAccent
      ),

      onPressed: () {
        Navigator.of(context).pop();
      },

      child: const Text("cancel"),
    );

    final sendButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.blueAccent
      ),

      onPressed: () async {
        if (controller.text.isEmpty) {
          const snackbar = SnackBar(content: Text("text cannot be empty"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } else {

          final response = await dio.post(join(serverUrl, "api/clipboard/text"), data: {
            "text": controller.text
          }, options: options);

          final transferQueryResponse = protobuf.TransferQueryResponse.fromBuffer(response.data);
          if (transferQueryResponse.type == TransferData_DataType.ERROR) {
            final snackbar = SnackBar(content: Text("error occurs: ${transferQueryResponse.error}"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          } else {
            setStateTexts(() {
              texts.insert(0, transferQueryResponse.text);
            });
          }

          controller.text = "";
          Navigator.of(context).pop();
        }
      },

      child: const Text("send", style: TextStyle(color: Colors.white),),
    );


    showDialog(context: context, builder: (context) => AlertDialog(
      content: sizedbox,
      actions: [
        cancelButton,
        sendButton
      ],
    ));
  }

  Future<void> addImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    final path = result?.files.single.path;
    late void Function(void Function()) dialogSetState;

    if (path != null) {
      final formdata = FormData.fromMap({"file": await MultipartFile.fromFile(path)});
      final url = join(serverUrl, "api/clipboard/image");
      double rate = 0;

      showDialog(context: context, builder: (context) => StatefulBuilder(builder: (context, setState) {
        dialogSetState = setState;
        return AlertDialog(
          content: Text("传送进度: rate.toStringAsFixed(1)"),
          actions: [
            TextButton(
              onPressed: rate != 100.0 ? null : () {
                Navigator.of(context).pop();
              },

              child: const Text("OK"),
            )
          ],
        );
      }));

      await Future.delayed(const Duration(milliseconds: 10));

      final response = await dio.post(
        url,
        data: formdata,
        options: options,
        onSendProgress: (int sent, int total) {
          dialogSetState(() {
            rate = sent / total.toDouble() * 100;
          });

        }
      );



      final transferQueryResponse = protobuf.TransferQueryResponse.fromBuffer(response.data);
      if (transferQueryResponse.type == TransferData_DataType.ERROR) {
        final snackbar = SnackBar(content: Text("error occurs: ${transferQueryResponse.error}"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        setStateImages(() {
          images.insert(0, transferQueryResponse.image);
        });
      }
    }
  }

  Future<void> addFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();
    final path = result?.files.single.path;
    late void Function(void Function()) dialogSetState;

    if (path != null) {
      final formdata = FormData.fromMap({"file": await MultipartFile.fromFile(path)});
      final url = join(serverUrl, "api/clipboard/file");
      double rate = 0;

      showDialog(context: context, builder: (context) => StatefulBuilder(builder: (context, setState) {
        dialogSetState = setState;
        return AlertDialog(
          content: Text("传送进度: rate.toStringAsFixed(1)"),
          actions: [
            TextButton(
              onPressed: rate != 100.0 ? null : () {
                Navigator.of(context).pop();
              },

              child: const Text("OK"),
            )
          ],
        );
      }));

      await Future.delayed(const Duration(milliseconds: 10));

      final response = await dio.post(
          url,
          data: formdata,
          options: options,
          onSendProgress: (int sent, int total) {
            dialogSetState(() {
              rate = sent / total.toDouble() * 100;
            });
          }
      );
      final transferQueryResponse = protobuf.TransferQueryResponse.fromBuffer(response.data);
      if (transferQueryResponse.type == TransferData_DataType.ERROR) {
        final snackbar = SnackBar(content: Text("error occurs: ${transferQueryResponse.error}"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        setStateFiles(() {
          files.insert(0, transferQueryResponse.file);
        });
      }
    }
  }

  Future<void> listenFunction(BuildContext context, dynamic event) async {
    final data = protobuf.TransferData.fromBuffer(event);
    if (data.type == TransferData_DataType.ERROR) {
      listenError(context, data);
    } else if (data.type == TransferData_DataType.NOTIFICATION) {
      if (data.touid != fromuid) {
        await onPressRefresh(controllerContext);
      }
    } else if (data.type == TransferData_DataType.TEXT) {
      listenText(context, data);
    } else {
      listenImageAndFile(context, data);
    }
  }

  void onError(BuildContext context, dynamic error) {
    socket?.sink.close();
    final snackbar = SnackBar(content: Text("error occurs: $error"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).pop();
  }

  void onDone(BuildContext context) {
    const snackbar = SnackBar(content: Text("connection closed"), duration: const Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  void listenError(BuildContext context, protobuf.TransferData data) {
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
  }

  void listenText(BuildContext context, protobuf.TransferData data) {
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
                Navigator.of(context).pop();
              },

              child: const Text("Ok"),
            )
          ],
        )
    );
  }

  void listenImageAndFile(BuildContext context, protobuf.TransferData data) {
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

                Navigator.of(context).pop();
              },

              child: const Text("Ok"),
            )
          ],
        )
    );
  }
}