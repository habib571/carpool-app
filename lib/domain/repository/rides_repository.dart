import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:dartz/dartz.dart';

abstract class RidesRepository {
  Future<Either<Failure,BaseResponse>> createRide(ShareRideRequest shareRideRequest) ; 
  Future<Either<Failure,RideResponse>>  getLatestRide() ;   
  Future<Either<Failure, BaseResponse>>   deleteRide(String rideId) ;   



}