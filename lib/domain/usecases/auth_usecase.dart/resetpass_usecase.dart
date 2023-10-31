import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/network/response.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase {
 final AuthRepository _repo ;   
 ResetPasswordUseCase(this._repo) ;
Future<Either<Failure ,BaseResponse>>  call(ResetPasswordRequest resetPasswordRequest)async {
 return await  _repo.resetPassword(resetPasswordRequest) ;
}
 

} 