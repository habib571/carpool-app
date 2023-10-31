import 'package:carpooling/main.dart';


class Apppreference {
static Future<void> setBearerToken(String token) async {  
    sharedPrefs.setString('Bearer', token) ; 
}
static Future<String?> getBearerToken() async {
   final token =sharedPrefs.getString('Bearer') ;   
   return token ;
}  
static Future<void> setLoginToken(String token) async {  
    sharedPrefs.setString('Bearer', token) ; 
}
static Future<String?> getLoginoken() async {
   final token =sharedPrefs.getString('logToken') ;   
   return token ;
} 


}