import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/page/datapage.dart';
import 'package:frontend/state.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StartPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final state = context.read<GlobalState>();
    final serverUrl = state.websocketUrl;
    final textfield = TextField(
      controller: controller,
      onChanged: (String value) {
        state.setFromuid(value);
      },
    );

    final sizedbox = FractionallySizedBox(
      widthFactor: 0.5,
      child: textfield,
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
                socket = IOWebSocketChannel.connect("${serverUrl}/api/transfer/${state.fromuid}");
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