import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/response.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class VerifyOtpUseCase {  
  final AuthRepository _repo ; 
  VerifyOtpUseCase(this._repo) ;
  Future<Either<Failure ,BaseResponse>> call(String otpcode ) async{   
     return  await  _repo.verifyOtp(otpcode) ;
 }  
 Future<Either<Failure ,BaseResponse>> resendCall(String phoneNumber)async{  
   return await _repo.resendOtp(phoneNumber) ;
}

}