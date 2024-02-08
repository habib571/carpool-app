import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/responses/auth_response.dart';

class VerifyOtpUseCase {  
  final AuthRepository _repo ; 
  VerifyOtpUseCase(this._repo) ;
  Future<Either<Failure ,AuthResponse>> call(String otpcode ) async{   
     return  await  _repo.verifyOtp(otpcode) ;
 }  
 Future<Either<Failure ,AuthResponse>> resendCall(String phoneNumber)async{  
   return await _repo.resendOtp(phoneNumber) ;
}

}