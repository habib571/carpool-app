class RegisterRequest {
  String username;
  String email;
  String password;
  String phoneNumber;
  String gender;

  RegisterRequest({
    required this.email,
    required this.username,
    required this.password,
    required this.gender,
    required this.phoneNumber
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      email: json['email'],
      username: json['username'],
      password: json['password'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'username': username,
      'password': password,
      'gender': gender,
      'phoneNumber': phoneNumber,
    };
    return data;
  }
}

class LoginRequest {
 String email ; 
 String password ;
 LoginRequest(this.email , this.password) ;
} 

class OtpRequest {  
 String code ; 
 String token ; 
 OtpRequest({
  required this.code ,
  required this.token
 }) ;

}  




class ResetPasswordRequest { 
  String email ; 
  String password ; 
  String passwordConfiramtion ; 
  String token ;
  ResetPasswordRequest(this.email ,this.password ,this.passwordConfiramtion ,this.token)  ;
}