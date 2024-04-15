class RegisterRequest {
  String firstname; 
  String lastname ;
  String email;
  String password;
  String phoneNumber;
  String gender;

  RegisterRequest({
    required this.email,
    required this.firstname,
    required this.password,
    required this.gender,
    required this.phoneNumber ,
    required this.lastname
  });

  
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


class UpdateInfoRequest {
  String firstname ; 
  String lastname ; 
  String gender ;  
  UpdateInfoRequest(this.firstname , this.lastname  , this.gender) ;
}

class ResetPasswordRequest { 
  String email ; 
  String password ; 
  String passwordConfiramtion ; 
  String token ;
  ResetPasswordRequest(this.email ,this.password ,this.passwordConfiramtion ,this.token)  ; 
}
  class ShareRideRequest { 
  String arrivalDate ;
  String arrivalTime ;
  String from ; 
  String to ; 
  String startCity ; 
  String endCity ;
  int seats ; 
  String time ; 
  String date ; 
  double price ; 
  double distance ; 

  ShareRideRequest(this.from , this.to , this.seats , this.time , this.date ,this.price , this.distance ,  this.arrivalDate , this.arrivalTime , this.startCity , this.endCity) ;
  
  }  
  class SeacrhRideRequest {  
    String startCity ; 
    String endCity ;
    String departureCity ; 
    String destinationCity ;  
    String date ;  
    SeacrhRideRequest( this.destinationCity ,this.departureCity , this.date ,this.startCity , this.endCity) ;

  }
