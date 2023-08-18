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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: buildBody(context),
        )
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final dio = Dio();
        final options = Options(
          headers: {
            "Accept": "application/x-protobuf"
          },

          responseType: ResponseType.bytes
        );

        final response = await dio.get("http://localhost:8082/api/clipboard/text", options: options);
        final data = protobuf.TransferQueryAllResponse.fromBuffer(response.data);
        print(data);
      },

      child: const Text("test"),
    );
  }
}