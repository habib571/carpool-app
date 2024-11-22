import 'package:carpooling/data/responses/base_response.dart';

import '../../domain/models/ride.dart';

class RidesResponse extends BaseResponse {
  RidesData? rideData;
  RidesResponse({this.rideData, super.message, super.success});
  factory RidesResponse.fromJson(Map<String, dynamic> json) {
    return RidesResponse(
        success: json['success'],
        message: json['message'],
        rideData: RidesData.fromJson(json['data']));
  }
}

class RidesData {
  List<Ride>? rides;
  RidesData({this.rides});
  factory RidesData.fromJson(Map<String, dynamic> json) {
    final rideList = json['rides'] as List<dynamic>? ?? [];
    print(rideList) ;
    List<Ride> parsedRideList = rideList.map((item) => Ride.fromJson(item as Map<String, dynamic>)).toList();
    return RidesData(rides: parsedRideList);
  }
}
