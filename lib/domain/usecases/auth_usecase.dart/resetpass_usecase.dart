import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/responses/auth_response.dart';

class ResetPasswordUseCase {
 final AuthRepository _repo ;   
 ResetPasswordUseCase(this._repo) ;
Future<Either<Failure ,AuthResponse>>  call(ResetPasswordRequest resetPasswordRequest)async {
 return await  _repo.resetPassword(resetPasswordRequest) ;
}
 

} 