import 'dart:convert';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/app/contants.dart';
import 'package:carpooling/data/network/cruds_methods.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:carpooling/data/responses/search_ride_response.dart';
import 'package:http/http.dart' as http;

abstract class RideRemoteDatsource {
  Future<BaseResponse> createRide(ShareRideRequest shareRideRequest);
  Future<RideResponse> getLatestRide();
  Future<BaseResponse> deleteRide(String rideId);
  Future<RidesResponse> seachRide(SeacrhRideRequest seacrhRideRequest);
  Future<RideResponse> getRideById(int id);
  Future<BaseResponse> bookRide(int id);
  Future<BaseResponse> acceptPassenger(int rideId, String passengerId);
}

class RideRemoteDatsourceImp implements RideRemoteDatsource {
  @override
  Future<BaseResponse> createRide(ShareRideRequest shareRideRequest) async {
    final token = await Apppreference.getBearerToken();
    final body = {
      'start_location': shareRideRequest.from,
      'end_location': shareRideRequest.to,
      'departure_date': shareRideRequest.date,
      'departure_time': shareRideRequest.time,
      'available_seats': shareRideRequest.seats,
      'price_per_seat': shareRideRequest.price,
      'estimated_arrival_date': shareRideRequest.arrivalDate,
      'estimated_arrival_time': shareRideRequest.arrivalTime,
      'start_city': shareRideRequest.startCity,
      'end_city': shareRideRequest.endCity,
    };
    return executePostRequest(
        bearerToken: token,
        body: body,
        apiUrl: '/api/rides/create-ride',
        onRequestResponse: (jsonResult) {
          return BaseResponse.fromJson(jsonResult);
        });
  }

  @override
  Future<RideResponse> getLatestRide() async {
    final token = await Apppreference.getBearerToken();
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/api/rides/latest-driver-ride'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);

    return RideResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> deleteRide(String rideId) async {
    final token = await Apppreference.getBearerToken();

    final response = await http.delete(
      Uri.parse('${Constants.baseUrl}/api/rides/delete-ride/$rideId'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final encoderesp = jsonDecode(response.body);
    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<RidesResponse> seachRide(SeacrhRideRequest seacrhRideRequest) async {
    final token = await Apppreference.getBearerToken();
    final body = {
      'departure_date': seacrhRideRequest.date,
      'start_city': seacrhRideRequest.startCity,
      'end_city': seacrhRideRequest.endCity
    };
    final encodedata = jsonEncode(body);
    print(encodedata);
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/api/rides/search-rides'),
      body: encodedata,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);
    return RidesResponse.fromJson(encoderesp);
  }

  @override
  Future<RideResponse> getRideById(int id) async {
    final tok = await Apppreference.getBearerToken();
    print("pffffffffffffffffff $tok");
    final response = await http.get(
        Uri.parse('${Constants.baseUrl}/api/rides/get-ride-info/$id'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tok',
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);
    return RideResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> bookRide(int id) async {


    final tok = await Apppreference.getBearerToken();
    print("pffffffffffffffffff $tok");
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/rides/$id/send-request'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tok',
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);
    return BaseResponse.fromJson(encoderesp);
  }

  @override
  Future<BaseResponse> acceptPassenger(int rideId, String passengerId) async {
    final tok = await Apppreference.getBearerToken();
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/rides/$rideId/accept/$passengerId'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tok',
        });
    final encoderesp = jsonDecode(response.body);
    print(encoderesp);
    return BaseResponse.fromJson(encoderesp);
  }
}
