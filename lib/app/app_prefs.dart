import 'package:carpooling/main.dart';

class Apppreference {
  static Future<void> setBearerToken(String token) async {
    storage.write(key: 'Bearer', value: token);
  }

  static Future<String?> getBearerToken() async {
    final token = storage.read(key: 'Bearer');
    return token;
  }

  static Future<void> setLoginToken(String token) async {
    storage.write(key: 'LogToken', value: token);
  }

  static Future<String?> getLoginoken() async {
    final token = storage.read(key: 'logToken');
    return token;
  }

  static Future<void> removeLoginToken() async {
    storage.delete(key: 'LogToken');
  }

  static Future<void> setUserId(String token) async {
    storage.write(key: 'UID', value: token);
  }

  static Future<String?> getUserId() async {
    final token = storage.read(key: 'UID');
    return token;
  }

  static Future<void> removeUserId() async {
    sharedPrefs.remove('UID');
  }
}
