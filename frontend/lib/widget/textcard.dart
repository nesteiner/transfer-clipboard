import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;

Widget buildTextCard(BuildContext context, protobuf.Text text, {
  void Function()? onPressCopy,
  void Function()? onPressShare,
  void Function()? onPressDelete
}) {
  final textwidget = Wrap(
    children: [
      Text(text.text)
    ],
  );

  final row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textwidget,
        ],
      ),

      Row(
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.blueAccent
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
            child: const Text("delete", style: const TextStyle(color: Colors.white),),
          )
        ],
      )
    ],
  );
  /**
   * card is width: 100% of parent, height: 100% of parent
   */
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
      )
    ),
  );

  return SizedBox(
    width: double.infinity,
    child: card,
  );
}

