import 'dart:convert';


import 'package:carpooling/app/contants.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<Response> register(RegisterRequest registerRequest);
  Future<Response> login(LoginRequest loginRequest);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<Response> login(LoginRequest loginRequest) async {
    final body = {
      'email': loginRequest.email,
      'password': loginRequest.password
    };
    final encodedata = jsonEncode(body);

    Response response =
        await dio.post('${Constants.baseUrl}/api/login', data: encodedata);
    final encoderesp = jsonDecode(response.data);
    print(encoderesp);
    return encoderesp;
  }

  @override
  Future<Response> register(RegisterRequest registerRequest) async {
    final body = {
      'email': registerRequest.email,
      'password': registerRequest.password,
      'first_name': 'habib',
      'phone_number': '20266417'
    };

  
    final encodedata = jsonEncode(body);
    print(encodedata);


    final response = await http.post(Uri.parse(Constants.baseUrl),
        body: encodedata,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    final encoderesp = jsonDecode(response.body);
    print(response.body);
    return encoderesp;
  }
}
