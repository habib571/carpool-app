import 'dart:convert';

import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/data/responses/user_data_response.dart';


import '../../../app/app_prefs.dart';
import 'package:http/http.dart' as http;

import '../../../app/contants.dart';

abstract class UserInfoRemoteDataSource {
  Future<AuthResponse> logout();
  Future<UserResponse> getUserData();
  Future<AuthResponse> updateUserInfo(UpdateInfoRequest updateInfoRequest);
  Future<AuthResponse> addminiBio(String bio);
  Future<AuthResponse> addCarBand(String brand);
  Future<AuthResponse> upadatePicture(String imagePath);

}

class UserInfoRemoteDataSourceImp implements UserInfoRemoteDataSource {
  //final LoginController _controller = Get.find<LoginController>();
  @override
  Future<AuthResponse> logout() async {
    final bearerToken = await Apppreference.getLoginoken(); 
   
    final response = await http
        .post(Uri.parse('${Constants.baseUrl}/api/auth/logout'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken',
      'Content-Type': 'application/json'
    });
    final encoderesp = jsonDecode(response.body);

    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<UserResponse> getUserData() async {
    final bearerToken = await Apppreference.getBearerToken() ;
     final  uid = await Apppreference.getUserId() ;
    final response = await http.get(
        Uri.parse(
            '${Constants.baseUrl}/api/user/info/$uid'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json'
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);

    return UserResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> updateUserInfo(
      UpdateInfoRequest updateInfoRequest) async { 
   final bearerToken = await Apppreference.getBearerToken() ;
     final  uid = await Apppreference.getUserId() ;
    final body = {
      'first_name': updateInfoRequest.firstname,
      'last_name': updateInfoRequest.lastname,
      'gender': updateInfoRequest.gender,
    };

    final encodedata = jsonEncode(body);
   
    final response = await http.put(
        Uri.parse(
            '${Constants.baseUrl}/api/user/update/info/$uid'),
        body: encodedata,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
          'Content-Type': 'application/json'
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);

    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> addCarBand(String brand) {
    
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> addminiBio(String bio) async { 
    final bearerToken = await Apppreference.getLoginoken(); 
     final  uid = await Apppreference.getUserId() ;
    final body = {'mini_bio': bio};
    final encodedata = jsonEncode(body);
    final response = await http.put(
        Uri.parse(
            '${Constants.baseUrl}/api/user/update/info/$uid'),
        body: encodedata,
        headers: {
          'Accept': 'application/json',
              'Authorization' : 'Bearer $bearerToken',
          'Content-Type': 'application/json'
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);
    return AuthResponse.fromJson(encoderesp);
  }

  @override
  Future<AuthResponse> upadatePicture(String imagePath) async { 
    final  uid = await Apppreference.getUserId() ;
    String url = '${Constants.baseUrl}/api/user/update/info/$uid'; 

    final bearerToken = await Apppreference.getBearerToken() ;
  
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers['Accept'] = 'application/json';
  request.headers['Authorization'] = bearerToken!;
  
  // Add other fields as needed
  request.fields['profile_picture'] = 'profile_pictures/$imagePath';
  request.fields['_method'] = 'PUT';

  // Add image file
  var file = await http.MultipartFile.fromPath('profile_picture', imagePath);
       request.files.add(file);
       var response = await request.send();
       var decodedResp = json.decode(await response.stream.bytesToString());
        print(decodedResp);

      return AuthResponse.fromJson(decodedResp);

   
  }
}
