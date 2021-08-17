import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorage {
  static getlocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory;
  }

  static Future<File> getLocalFile(
      {required String localPath, required String fileName}) async {
    return File('$localPath/$fileName');
  }

  static Future<File> createLocalFile(
      {required String localPath, required String fileName}) async {
    final file = await File('$localPath/$fileName').create();
    return file;
  }

  static Future<File> writeFile(
      {required File file, required String value}) async {
    return file.writeAsString('$value');
  }
}
