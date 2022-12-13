import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final storage = const FlutterSecureStorage();

  Future<String> readAuthStorage(String key) async {
    final userId = await storage.read(key: key);
    if (userId != null) {
      return userId;
    } else {
      return '';
    }
  }

  Future writeAuthStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future deleteAuthStorage(String key) async {
    await storage.delete(key: key);
  }
}
