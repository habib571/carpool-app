import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';



class LoginUsecase { 
  final AuthRepository _repo ; 
  LoginUsecase(this._repo) ;

  Future<Either<Failure ,Response>> call(LoginRequest loginRequest) async { 
   return await _repo.login(loginRequest) ;
   } 


}