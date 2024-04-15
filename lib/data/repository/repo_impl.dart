import 'package:carpooling/data/network/failure.dart';

import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/login_response.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../datasource/remote/auth_remote_data.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';
import '../responses/auth_response.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImp(this._networkInfo, this._authRemoteDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.login(loginRequest);
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
  Future<Either<Failure, AuthResponse>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.register(registerRequest);
        if (response.success! !=false) {
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
        print('_________________________________________________ $error');
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyOtp(String otpcode) async {
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
  Future<Either<Failure, AuthResponse>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.forgotPassword(email);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, AuthResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _authRemoteDataSource.resetpassword(resetPasswordRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, AuthResponse>> resendOtp(String phoneNumber) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _authRemoteDataSource.resendOtp(phoneNumber);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}
