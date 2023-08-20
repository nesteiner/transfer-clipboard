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

  final size = MediaQuery.of(context).size;
  final url = join(serverUrl, "api/download/image", image.name);

  final imageFromNetwork = Image.network(url, height: 100, width: 100,);

  final left = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      imageFromNetwork,
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(image.name, overflow: TextOverflow.ellipsis,),
          Text(image.size)
        ]
      )
    ],
  );

  final right = Row(
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
    ],
  );


  final row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: size.width * 0.4 * 0.9,
        child: left,
      ),

      Expanded(
        child: right,
      )
    ],
  );

  final card = Card(
    elevation: 20.0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),

    child: FractionallySizedBox(
      widthFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: row,
      ),
    )
  );

  return SizedBox(
    width: double.infinity,
    child: card
  );
}

