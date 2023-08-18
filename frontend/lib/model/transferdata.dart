import 'dart:typed_data';

class TransferData {
  String fromuid;
  String touid;
  String message;
  Uint8List data;

  TransferData(this.fromuid, this.touid, this.message, this.data);
  Map<String, dynamic> toJson() {
    return {
      "fromuid": fromuid,
      "touid": touid,
      "message": message,
      "data": data
    };
  }
}