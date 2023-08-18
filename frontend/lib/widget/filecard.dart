import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;

Widget buildFileCard(BuildContext context, protobuf.File file, {
  void Function()? onPressCopy,
  void Function()? onPressShare,
  void Function()? onPressDelete
}) {
  final icon = Icon(Icons.file_copy_outlined, size: 20,);
  final description = Column(
    children: [
      icon,
      Text(file.name),
      Text(file.size)
    ],
  );

  final row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      description,
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
          ]
      )
    ],
  );

  return SizedBox(
    width: double.infinity,
    child: FractionallySizedBox(
      widthFactor: 0.8,
      child: row,
    ),
  );
}
