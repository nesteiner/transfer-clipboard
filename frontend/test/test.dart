import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await getTemporaryDirectory();
  } on Exception catch (exception) {
    print(exception);
  }
}