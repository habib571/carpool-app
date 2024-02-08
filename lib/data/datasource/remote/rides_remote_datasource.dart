import 'dart:convert';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/app/contants.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:http/http.dart' as http;
abstract class RideRemoteDatsource {
 Future<BaseResponse>  createRide(ShareRideRequest shareRideRequest) ;  
 Future<RideResponse> getLatestRide() ;
} 
class RideRemoteDatsourceImp implements RideRemoteDatsource { 
   @override 
   Future<BaseResponse> createRide(ShareRideRequest shareRideRequest) async {   
     final token = await Apppreference.getBearerToken() ;
     final body ={  
        'start_location' : shareRideRequest.from ,  
        'end_location' : shareRideRequest.to , 
        'departure_date'  : shareRideRequest.date , 
        'departure_time' : shareRideRequest.time ,
        'available_seats' : shareRideRequest.seats , 
        'price_per_seat' :shareRideRequest.price ,      
        'estimated_arrival_date' : shareRideRequest.arrivalDate ,  
        'estimated_arrival_time'  :shareRideRequest.arrivalTime


     } ;
       final encodedata = jsonEncode(body);
     
         final response = await http.post(
         Uri.parse(
            '${Constants.baseUrl}/api/rides/create-ride') ,
         body : encodedata ,
        headers: {
          'Accept': 'application/json',
          'Authorization':
          'Bearer $token',
          'Content-Type': 'application/json'
        } ,
        );
    final encoderesp = jsonDecode(response.body);
    print('response $encoderesp token : $token');

    return AuthResponse.fromJson(encoderesp);
  } 
  @override 
  Future<RideResponse> getLatestRide() async {  
     final token = await Apppreference.getBearerToken() ;
     final response = await http.get(
       Uri.parse('${Constants.baseUrl}/api/rides/latest-driver-ride') , 
       headers: {
          'Accept': 'application/json',
          'Authorization':
          'Bearer $token',
          'Content-Type': 'application/json'
        } ,
     ) ;
     final encoderesp = jsonDecode(response.body);
    print(encoderesp);

    return RideResponse.fromJson(encoderesp);
  }
}