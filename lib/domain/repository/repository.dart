import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/network/response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, BaseResponse>> register(RegisterRequest loginRequest);
  Future<Either<Failure, BaseResponse>> verifyOtp(String otpcode);
  Future<Either<Failure, BaseResponse>> forgotPassword(String email);
  Future<Either<Failure, BaseResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);
  Future<Either<Failure, BaseResponse>> resendOtp(String phoneNumber);
}
