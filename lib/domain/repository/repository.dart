import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

  abstract class AuthRepository { 

Future<Either<Failure,Response>> login(LoginRequest loginRequest) ; 
Future<Either<Failure,Response>> register( RegisterRequest loginRequest) ; 



}