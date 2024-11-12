import 'dart:convert';

import 'package:carpooling/app/contants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<T> executeGetRequest<T>({
  required String apiUrl,
  String? bearerToken,
  bool decodeResult = true,
  required T Function(dynamic result) onRequestResponse,
  void Function(int statusCode, String responseBody)? onError,
}) async {
  final response = await http.get(
    Uri.https(
      Constants.baseUrl,
      apiUrl,
    ),
    headers: <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      if (bearerToken != null) 'Authorization': 'Bearer $bearerToken'
    },
  );

  final jsonResult = decodeResult
      ? jsonDecode(response.body) as Map<String, dynamic>
      : response.body;
  return onRequestResponse(jsonResult);
}

Future<T> executePostRequest<T>({
  required String apiUrl,
  Map<String, dynamic>? body,
  String? bearerToken,

  required T Function(dynamic result) onRequestSuccess,
}) async {
  final requestBody = body != null ? jsonEncode(body) : null;
  final response = await http.post(
    Uri.parse(Constants.baseUrl+apiUrl),
    headers: <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      if (bearerToken != null) 'Authorization': 'Bearer $bearerToken'
    },
    body: requestBody,
  );

  final jsonResult =
     jsonDecode(response.body)  ;

  return onRequestSuccess(jsonResult);
}
