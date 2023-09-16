import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../data/network/failure.dart';

class RegisterUseCase{ 
 final AuthRepository _repo ; 
  RegisterUseCase(this._repo) ; 
  Future<Either<Failure, Response>> call(RegisterRequest registerRequest) async {
    return await _repo.register(registerRequest) ;
  }

}