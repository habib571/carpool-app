

class RegisterRequest { 
 String username ;  
 String email ; 
 String password ; 

RegisterRequest(this.email,this.username ,this.password ) ;
 
} 

class LoginRequest {
 String email ; 
 String password ;
 LoginRequest(this.email , this.password) ;
}