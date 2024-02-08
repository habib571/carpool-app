 import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/user_data_response.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/responses/auth_response.dart';

abstract class UserInfoRepositpry  { 
   Future<Either<Failure, AuthResponse>> logout() ; 
   Future<Either<String, UserResponse>> getUserData() ;  
   Future<Either<Failure , AuthResponse>> addMiniBio( String bio) ;  
   Future<Either<Failure , AuthResponse>> updateInfo(UpdateInfoRequest updateInfoRequest ) ; 
   Future<Either<Failure , AuthResponse>> updatePicture(String imagePath) ;
   
 }