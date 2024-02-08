import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';


class ForgotUseCase {
final AuthRepository _repo ; 
ForgotUseCase(this._repo) ; 
Future<Either<Failure, AuthResponse>> call(String email)async { 
 return  await _repo.forgotPassword(email) ; 
}
Future<Either<Failure, AuthResponse>> resetCall(ResetPasswordRequest resetPasswordRequest)async { 
 return  await _repo.resetPassword(resetPasswordRequest) ;
}
}