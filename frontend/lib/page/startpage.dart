import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/page/datapage.dart';
import 'package:frontend/state.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StartPage extends StatelessWidget {
  final TextEditingController serverUrlController = TextEditingController();
  final TextEditingController uidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final state = context.read<GlobalState>();
    final inputServerUrl = TextField(
      controller: serverUrlController,
      decoration: const InputDecoration(
        labelText: "服务器地址",
        hintText: "ip:port"
      ),

      onChanged: (String value) {
        state.serverUrl = "http://${value}";
        state.websocketUrl = "ws://${value}";
      },
    );

    final inputUid = TextField(
      controller: uidController,
      decoration: const InputDecoration(
        labelText: "登陆名",
        hintText: "uid"
      ),

      onChanged: (String value) {
        state.fromuid = value;
      },
    );

    final sizedbox = FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputServerUrl,
          inputUid
        ],
      ),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sizedbox,
          OutlinedButton(
            onPressed: () {
              try {
                final url = join(state.websocketUrl, "api/transfer", state.fromuid);
                socket = IOWebSocketChannel.connect(url);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataPage()));
              } on WebSocketChannelException catch (exception) {
                showDialog(context: context, builder: (context) => AlertDialog(
                  content: Text("connect failed: ${exception.message ?? "fuck"}"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },

                      child: const Text("OK"),
                    )
                  ],
                ));
              }
            },

            child: const Text("connect"),
          )
        ],
      ),
    );
  }
}