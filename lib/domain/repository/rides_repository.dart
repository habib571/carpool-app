import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:dartz/dartz.dart';
import '../../data/responses/search_ride_response.dart';

abstract class RidesRepository {
  Future<Either<Failure,BaseResponse>> createRide(ShareRideRequest shareRideRequest) ; 
  Future<Either<Failure,RideResponse>>  getLatestRide() ;   
  Future<Either<Failure, BaseResponse>>   deleteRide(String rideId) ;    
  Future<Either<Failure,RidesResponse>>   searchRide(SeacrhRideRequest seacrhRideRequest) ;    
  Future<Either<Failure,RideResponse>> getRideById(int id) ; 
  Future<Either<Failure,BaseResponse>> bookRide(int id) ; 
  Future<Either<Failure,BaseResponse>> acceptPassenger(int rideId , String passengerId) ;




}