import 'package:carpooling/main.dart';

class Apppreference {
  static Future<void> setBearerToken(String token) async {
    storage.write(key: 'Bearer', value: token);
  }

  static  getBearerToken()   {
    final token = storage.read(key: 'Bearer');
    return token;
  }  

 static Future<void> removeBearerToken() async {
    storage.delete(key: 'Bearer');
  }

  static  setLogin() {
    sharedPrefs.setString('login', '1') ;
  }

 

  static  removeLogin()  {
    sharedPrefs.remove('login') ;
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
