


import 'package:carpooling/data/responses/base_response.dart';


import '../../domain/models/user.dart';

class UserResponse extends BaseResponse {
 UserData? userData ;    
 UserResponse({this.userData ,super.message ,super.success}) ;
     factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(   
      success: json['success'],
      message : json['message'] ,
    userData: UserData.fromJson(json['data']) 
    );
  }
} 
class UserData {  
  User? user ; 
  UserData({
    this.user ,
  }) ;
    factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
  
      user: User.fromJson(json['user']),

    );
  }
  
}  
