import 'package:flutter/material.dart';
import 'package:frontend/protobuf/.proto.pb.dart' as protobuf;

Widget buildFileCard(BuildContext context, protobuf.File file, {
  void Function()? onPressCopy,
  void Function()? onPressShare,
  void Function()? onPressDelete
}) {
  final size = MediaQuery.of(context).size;
  
  final icon = Icon(Icons.file_copy_outlined, size: 20,);
  final description = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icon,
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(file.name, overflow: TextOverflow.ellipsis,),
          Text(file.size)
        ],
      )

    ],
  );

  final right = Row(
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
  );
  
  final row = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: size.width * 0.4 * 0.9,
        child: description,
      ),
      
      Expanded(child: right)
    ],
  );

  final card = Card(
    elevation: 20.0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),

    child: FractionallySizedBox(
      widthFactor: 0.9,
      child: row,
    ),
  );

  return SizedBox(
    width: double.infinity,
    child: card
  );
}
