
import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/responses/auth_response.dart';

class  ResendOtpUseCase { 
final AuthRepository _repo ; 
ResendOtpUseCase(this._repo) ; 
Future<Either<Failure ,AuthResponse>> call(String phoneNumber)async{  
   return await _repo.resendOtp(phoneNumber) ;
}
  
}