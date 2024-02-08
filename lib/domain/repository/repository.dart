import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../data/responses/auth_response.dart';
import '../../data/responses/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, AuthResponse>> register(RegisterRequest loginRequest);
  Future<Either<Failure, AuthResponse>> verifyOtp(String otpcode);
  Future<Either<Failure, AuthResponse>> forgotPassword(String email);
  Future<Either<Failure, AuthResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);
  Future<Either<Failure, AuthResponse>> resendOtp(String phoneNumber);  

  
}
