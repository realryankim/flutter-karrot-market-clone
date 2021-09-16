import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageRepository {
  // create storage
  final storage = new FlutterSecureStorage();

  // read value
  Future<String?>? getStoredValue(String key) async {
    try {
      return await storage.read(key: key);
    } catch (error) {
      return null;
    }
  }

  // write value
  Future<void> storeValue(String key, String value) async {
    try {
      return await storage.write(key: key, value: value);
    } catch (error) {
      return null;
    }
  }
}
