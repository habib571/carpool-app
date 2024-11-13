import 'dart:convert';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/app/contants.dart';
import 'package:carpooling/data/network/cruds_methods.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../responses/auth_response.dart';
import '../../responses/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> register(RegisterRequest registerRequest);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> verifyOtp(String otpcode);
  Future<AuthResponse> forgotPassword(String email);
  Future<AuthResponse> resetpassword(ResetPasswordRequest resetPasswordRequest);
  Future<AuthResponse> resendOtp(String phoneNumber);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final body = {
      'email': loginRequest.email,
      'password': loginRequest.password
    };
    return await executePostRequest<LoginResponse>(
        apiUrl: '/api/auth/login',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return LoginResponse.fromJson(jsonResponse);
        });
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    final body = {
      'email': registerRequest.email,
      'password': registerRequest.password,
      'first_name': registerRequest.firstname,
      'last_name': registerRequest.lastname,
      'phone_number': registerRequest.phoneNumber,
      'gender': registerRequest.gender
    };
    return await executePostRequest<AuthResponse>(
        apiUrl: '/api/auth/login',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return AuthResponse.fromJson(jsonResponse);
        });
  }

  @override
  Future<AuthResponse> verifyOtp(String otpcode) async {
    final body = {'sms_code': otpcode};
    return await executePostRequest<AuthResponse>(
        apiUrl: '/api/sms/verify',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return AuthResponse.fromJson(jsonResponse);
        });
  }

  @override
  Future<AuthResponse> forgotPassword(String email) async {
    final body = {
      'email': email,
    };
    return await executePostRequest<AuthResponse>(
        apiUrl: '/api/forgot/password',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return AuthResponse.fromJson(jsonResponse);
        });
  }

  @override
  Future<AuthResponse> resetpassword(
      ResetPasswordRequest resetPasswordRequest) async {
    final body = {
      'email': resetPasswordRequest.email,
      'password': resetPasswordRequest.password,
      'password_confirmation': resetPasswordRequest.passwordConfiramtion,
      'token': resetPasswordRequest.token
    };
    return await executePostRequest<AuthResponse>(
        apiUrl: '/api/password/reset',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return AuthResponse.fromJson(jsonResponse);
        });
  }

  @override
  Future<AuthResponse> resendOtp(String phoneNumber) async {
    final body = {
      'phone_number': phoneNumber,
    };
    return await executePostRequest<AuthResponse>(
        apiUrl: '/api/auth/sms/resend',
        body: body,
        onRequestSuccess: (jsonResponse) {
          return AuthResponse.fromJson(jsonResponse);
        });
  }
}
