import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/domain/models/ride.dart';

class RideResponse extends BaseResponse{ 
 RideData? rideData ;
 RideResponse({this.rideData  ,super.message , super.success}) ; 
  factory RideResponse.fromJson(Map<String, dynamic> json) {
    return RideResponse(   
      success: json['success'],
      message : json['message'] ,
    rideData: RideData.fromJson(json['data']) 
    );
  }
} 
class RideData { 
  Ride? ride ;  
  RideData({this.ride}) ;
    factory RideData.fromJson(Map<String, dynamic> json) {
    return RideData(
  
      ride: Ride.fromJson(json['userRide']),

    );
  }
}