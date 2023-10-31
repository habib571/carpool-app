import 'dart:convert';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/app/contants.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/network/response.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<BaseResponse> register(RegisterRequest registerRequest);
  Future<BaseResponse> login(LoginRequest loginRequest);
  Future<BaseResponse> verifyOtp(String otpcode);
  Future<BaseResponse> forgotPassword(String email);
  Future<BaseResponse> resetpassword(ResetPasswordRequest resetPasswordRequest);
  Future<BaseResponse> resendOtp(String phoneNumber);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  Future<BaseResponse> login(LoginRequest loginRequest) async {
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

        final isSuccess = BaseResponse.fromJson(encoderesp).success;

    if (isSuccess) {
      final token = BaseResponse.fromJson(encoderesp).data['token'];
      print(token);

      await Apppreference.setLoginToken(token);
    }
    if (kDebugMode) {
      print(encoderesp);
    }
    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> register(RegisterRequest registerRequest) async {
    final body = {
      'email': registerRequest.email,
      'password': registerRequest.password,
      'first_name': registerRequest.username,
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
    final isSuccess = BaseResponse.fromJson(encoderesp).success;

    if (isSuccess) {
      final token = BaseResponse.fromJson(encoderesp).data['token'];
      print(token);

      await Apppreference.setBearerToken(token);
    }

    if (kDebugMode) {
      print(response.body);
    }
    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> verifyOtp(String otpcode) async {
    final body = {'login_code': otpcode};
    print('otp is $otpcode ');
    final endodeData = jsonEncode(body);
    final bearerToken = await Apppreference.getBearerToken();
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/user/verify'),
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

    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> forgotPassword(String email) async {
    final body = {
      'email': email,
    };
    final endcodeData = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/password/forgot'),
        body: endcodeData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> resetpassword(
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

    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> resendOtp(String phoneNumber) async {
    final body = {
      'phone_number': phoneNumber,
    };
    final endcodeData = jsonEncode(body);
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/login/resend-verification-code'),
        body: endcodeData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (kDebugMode) {
      print(response.body);
    }
    final encoderesp = jsonDecode(response.body);

    return BaseResponse.fromJson(encoderesp);
  }
}
