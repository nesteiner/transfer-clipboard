import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;
import 'package:path/path.dart';

Widget buildTextCard(BuildContext context, protobuf.Text text, {
  void Function()? onPressCopy,
  void Function()? onPressShare,
  void Function()? onPressDelete
}) {
  /**
   * card is width: 100% of parent, height: 100% of parent
   */
  final card = Card(
    elevation: 20.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),

    child: FractionallySizedBox(
      widthFactor: 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(text.text),
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
      ),
    ),
  );

  return SizedBox(
    width: double.infinity,
    child: card,
  );
}

