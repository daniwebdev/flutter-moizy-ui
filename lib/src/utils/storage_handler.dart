import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageHandler {
  Directory? _dir;
  String? _path;

  static StorageHandler? _instance;

  StorageHandler._() {
    getDirectory().then((Directory dir) {
      _dir = dir;
      _path = dir.path;
    });
  }

  static StorageHandler get instance {
    _instance ??= StorageHandler._();
    return _instance!;
  }

  void setPath(String path) {
    instance._path = path;
  }

  Future<Directory> getDirectory() async {
    // check platform
    // if (Platform.isAndroid) {
    //   _dir = Directory('/storage/emulated/0/moizy');

    //   var status = await Permission.storage.request();

    //   if (!status.isGranted) {
    //     throw Exception('Permission denied');
    //   }

    //   if (!_dir!.existsSync()) {
    //     _dir!.createSync(recursive: true);
    //   }
    // } else {
    // }
    _dir = _dir ?? await getExternalStorageDirectory();

    return _dir!;
  }

  Future<File> writeFile(String filename, String content) async {
    final Directory dir = await getDirectory();
    final File file = File('${dir.path}/$filename');
    return file.writeAsString(content, mode: FileMode.write);
  }

  Future<File> writeMapAsJSON(String filename, Map map) async {
    String json = const JsonEncoder().convert(map);

    final File file = await writeFile(filename, json);

    return file;
  }

  Future<String> readFile(String filename, {Function(File)? onFileIsNotExist}) async {
    final Directory dir = await getDirectory();
    final File file = File('${dir.path}/$filename');

    if (!await file.exists()) {
      if (onFileIsNotExist != null) {
        onFileIsNotExist(file);
      } else {
        throw Exception('File $filename is not exist');
      }
    }

    return file.readAsString();
  }

  Future<void> deleteFile(String filename) async {
    final Directory dir = await getDirectory();
    final File file = File('${dir.path}/$filename');
    file.delete();
  }

  Future<bool> exists(String filename) async {
    final Directory dir = await getDirectory();
    final File file = File('${dir.path}/$filename');
    return file.existsSync();
  }

  Future<void> createDirIfNotExist(String dirname) async {
    final Directory dir = await getDirectory();
    final Directory newDir = Directory('${dir.path}/$dirname');
    if (!newDir.existsSync()) {
      newDir.createSync(recursive: true);
    }
  }
}
