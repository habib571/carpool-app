import '../../domain/models/user.dart';
import 'base_response.dart';

class LoginResponse extends BaseResponse {
 LoginData? loginData ;   
 String? mess;
 LoginResponse({this.loginData ,this.mess ,super.message ,super.success}) ;
     factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(   
      success: json['success'],
      message : json['message'] ,
      mess: json['message'],
    loginData: LoginData.fromJson(json['data']) 
    );
  }
} 
class LoginData {  
  User? user ; 
  String? message ;
  String? token ; 
  LoginData({
    this.message ,
    this.user , 
    this.token
  }) ;
    factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
     message: json['message'] ?? '',  
      user: User.fromJson(json['user']),
      token : json['token'] ?? ''

    );
  }
  
}  