import 'package:carpooling/data/responses/base_response.dart';

class AuthResponse extends BaseResponse {
 Map<String, dynamic>? data;
  AuthResponse({this.data ,super.message , super.success});
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: (json['data'] as Map<String, dynamic>?) ?? {} , 
       success: json['success'] ?? false,
      message : json['message']  ??''
    );
  }
}
