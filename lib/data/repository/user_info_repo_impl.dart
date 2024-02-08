import 'dart:io';

import 'package:carpooling/data/datasource/remote/userinfo_remote_datasource.dart';
import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/data/responses/user_data_response.dart';
import 'package:carpooling/domain/repository/user_info_repo.dart';
import 'package:dartz/dartz.dart';


import '../network/error_handler.dart';
import '../network/network_info.dart';

class UserInfoRepositpryImp implements UserInfoRepositpry {
  final UserInfoRemoteDataSource _infoRemoteDataSource;
  final NetworkInfo _networkInfo;
  UserInfoRepositpryImp(this._infoRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthResponse>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _infoRemoteDataSource.logout();
        if (response.success!) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) { 
         
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<String, UserResponse>> getUserData() async { 
           
    if (await _networkInfo.isConnected) {
      try {
        final response = await _infoRemoteDataSource.getUserData();
     
        if (response.success!) {
    
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return const Left('Failure');
        } 
        } on SocketException catch (e) {
    // Handle ClientException
      
    Left(e);

  }
      
    }
    return const Left('Failure');
  }

  @override
  Future<Either<Failure, AuthResponse>> addMiniBio(String bio) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _infoRemoteDataSource.addminiBio(bio);
        print(response.success);
        if (response.success!) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, response.message!));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, AuthResponse>> updateInfo(UpdateInfoRequest updateInfoRequest) async{
     if (await _networkInfo.isConnected) {
      try {
        final response = await _infoRemoteDataSource.updateUserInfo(updateInfoRequest) ;
        if (response.success!) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, response.message!));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
  
  @override
  Future<Either<Failure, AuthResponse>> updatePicture(String imagePath)async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _infoRemoteDataSource.upadatePicture(imagePath) ;
  
        if (response.success!) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE, response.message!));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

    
  }

