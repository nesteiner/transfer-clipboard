import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;
import 'package:frontend/state.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

Widget buildImageCard(BuildContext context, protobuf.Image image, {
  void Function()? onPressCopy,
  void Function()? onPressShare,
  void Function()? onPressDelete,
}) {
  final state = context.read<GlobalState>();
  final serverUrl = state.serverUrl;

  assert(image.name.isNotEmpty);
  final url = join(serverUrl, "api/download/image", image.name);

  final imageFromNetwork = Image.network(url, height: 100, width: 100,);
  final imageDescription = Row(
    children: [
      imageFromNetwork,
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(image.name),
          Text(image.size)
        ]
      )
    ],
  );

  final row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      imageDescription,
      Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.blueAccent,
              ),

              onPressed: onPressCopy,
              child: const Text("copy", style: const TextStyle(color: Colors.white),),
            ),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blueAccent
              ),
              onPressed: onPressShare,
              child: const Text("share"),
            ),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red
              ),

              onPressed: onPressDelete,
              child: const Text("delete", style: const TextStyle(color: Colors.white)),
            )
          ]
      )
    ],
  );

  final card = Card(
    elevation: 20.0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),

    child: FractionallySizedBox(
      widthFactor: 0.8,
      child: row,
    )
  );

  return SizedBox(
    width: double.infinity,
    child: card
  );
}

