import 'package:carpooling/data/network/failure.dart';

import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/network/response.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../datasource/remote/auth_remote_data.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImp(this._networkInfo, this._authRemoteDataSource);

  @override
  Future<Either<Failure, BaseResponse>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _authRemoteDataSource.login(loginRequest);
      return Right(response);
    }

    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, BaseResponse>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      //   try {
      final response = await _authRemoteDataSource.register(registerRequest);
      return Right(response);

      /* } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }*/
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, BaseResponse>> verifyOtp(String otpcode) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.verifyOtp(otpcode);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
  
  @override
  Future<Either<Failure, BaseResponse>> forgotPassword(String email) async {
 if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.forgotPassword(email) ;
         return Right(response) ;
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  
  }
  
  @override
  Future<Either<Failure, BaseResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest)async {
     if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.resetpassword(resetPasswordRequest) ;
         return Right(response) ;
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());

  }
  
  @override
  Future<Either<Failure, BaseResponse>> resendOtp(String phoneNumber) async {
         if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.resendOtp(phoneNumber);
         return Right(response) ;
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    
  }
}
