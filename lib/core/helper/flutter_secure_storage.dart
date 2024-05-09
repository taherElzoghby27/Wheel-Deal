import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageEncrypted {
  static late FlutterSecureStorage storage;

  init() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static readData(String key) async {
    String? value = await storage.read(key: key);
  }

  static delete(String key) async {
    await storage.delete(key: key);
  }

  static deleteAll() async {
    await storage.deleteAll();
  }
}
