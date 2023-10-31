import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/network/response.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import '../../../data/network/failure.dart';

class RegisterUseCase{ 
 final AuthRepository _repo ; 
  RegisterUseCase(this._repo) ; 
  Future<Either<Failure, BaseResponse>> call(RegisterRequest registerRequest) async {
    return await _repo.register(registerRequest) ;
  }

}