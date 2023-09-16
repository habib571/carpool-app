import 'package:carpooling/data/network/failure.dart';

import 'package:carpooling/data/network/requests.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/repository.dart';
import '../datasource/remote/auth_remote_data.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class AuthRepositoryImp implements AuthRepository {  
  final AuthRemoteDataSource _authRemoteDataSource ;
  final NetworkInfo _networkInfo; 

   AuthRepositoryImp(this._networkInfo , this._authRemoteDataSource) ;

  @override
  Future<Either<Failure, Response>> login(LoginRequest loginRequest) async  { 
    if(await _networkInfo.isConnected) {  
      try { 
          final Response response  =await _authRemoteDataSource.login(loginRequest) ;  

            if(response.statusCode == ApiInternalStatus.SUCCESS ) {
              return Right(response) ; 
               } 
             else {  
              return Left(Failure(ApiInternalStatus.FAILURE, response.statusMessage?? ResponseMessage.DEFAULT)) ;
 
             }
      }
      catch(error) {
         Left(ErrorHandler
            .handle(error)
            .failure);
      }
    }
  
          return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    
  }

   
  @override
  Future<Either<Failure, Response>> register(RegisterRequest registerRequest) async{ 

    if(await _networkInfo.isConnected) { 
       
     try {
         final response = await _authRemoteDataSource.register(registerRequest) ; 

        if (response.statusCode == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.statusMessage ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
       


    } 
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  
  }



  
 }