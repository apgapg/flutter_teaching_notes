import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<File> get dataFile async {
    final path = await localPath;
    return new File('$path/data.json');
  }

  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
