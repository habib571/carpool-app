
import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/response.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class  ResendOtpUseCase { 
final AuthRepository _repo ; 
ResendOtpUseCase(this._repo) ; 
Future<Either<Failure ,BaseResponse>> call(String phoneNumber)async{  
   return await _repo.resendOtp(phoneNumber) ;
}
  
}