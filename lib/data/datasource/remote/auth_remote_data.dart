import 'dart:convert';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/app/contants.dart';
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
    final encodedata = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/login'),
        body: encodedata,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    final encoderesp = jsonDecode(response.body);

   
    if (kDebugMode) {
      print(encoderesp);
    }
    return LoginResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    final body = {
      'email': registerRequest.email, 
      'password': registerRequest.password,
      'first_name': registerRequest.firstname,
      'last_name' : registerRequest.lastname ,
      'phone_number': registerRequest.phoneNumber,
      'gender': registerRequest.gender 
    };

    final encodedata = jsonEncode(body);
    if (kDebugMode) {
      print(encodedata);
    }

    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/register'),
        body: encodedata,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    final encoderesp = jsonDecode(response.body);
  

    if (kDebugMode) {
      print(response.body);
    }
    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> verifyOtp(String otpcode) async {
    final body = {'sms_code': otpcode};
    print('otp is $otpcode ');
    final endodeData = jsonEncode(body);
    final bearerToken = await Apppreference.getBearerToken();
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/sms/verify'),
        body: endodeData,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json'
        });

    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> forgotPassword(String email) async {
    final body = {
      'email': email,
    };
    final endcodeData = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/password/forgot'),
        body: endcodeData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return AuthResponse.fromJson(encoderesp);
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
    final endodeData = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/password/reset'),
        body: endodeData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> resendOtp(String phoneNumber) async {
    final body = {
      'phone_number': phoneNumber,
    };
    final endcodeData = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/sms/resend'),
        body: endcodeData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return AuthResponse.fromJson(encoderesp);
  }
}
