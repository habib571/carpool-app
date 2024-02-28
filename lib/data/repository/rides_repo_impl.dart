 // ignore_for_file: avoid_print

 import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/network/error_handler.dart';
import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:carpooling/data/responses/search_ride_response.dart';
import 'package:carpooling/domain/repository/rides_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../network/network_info.dart';

class RidesRepositoryImp implements RidesRepository { 
  final RideRemoteDatsourceImp _rideRemoteDatsourceImp;
  final NetworkInfo _networkInfo;
  RidesRepositoryImp(this._networkInfo , this._rideRemoteDatsourceImp) ;
  @override

       Future<Either<Failure, BaseResponse>> createRide(ShareRideRequest shareRideRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await  _rideRemoteDatsourceImp.createRide(shareRideRequest ) ;
        if (response.message != '' ) {
          // success
          // return either right
          // return data 
          
          return Right(response);
        } else {
          // failure --return business error
          // return either left 
         
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {  
        if (kDebugMode) {
          print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh______________________________  $error') ;
        }
        
        return Left(Failure(ApiInternalStatus.FAILURE, 'dvsd' ));
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, RideResponse>> getLatestRide()  async{ 
     if (await _networkInfo.isConnected) {
      try {
        final response = await  _rideRemoteDatsourceImp.getLatestRide() ;
        if (response.success!) {
          // success
          // return either right
          // return data 
          
          return Right(response);
        } else {
          // failure --return business error
          // return either left 
         
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {  
        print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh_____________________________  $error') ;
        
        return Left(Failure(ApiInternalStatus.FAILURE, 'Something went Wrong ' ));
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
  
  @override
  Future<Either<Failure, BaseResponse>> deleteRide(String rideId) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await  _rideRemoteDatsourceImp.deleteRide(rideId) ;
        if (response.success!) {
          // success
          // return either right
          // return data 
          
          return Right(response);
        } else {
          // failure --return business error
          // return either left 
         
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {  
        print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh_____________________________  $error') ;
        
        return Left(Failure(ApiInternalStatus.FAILURE, 'Something went Wrong ' ));
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  @override
  Future<Either<Failure, RidesResponse>> searchRide( SeacrhRideRequest seacrhRideRequest) async { 
      if (await _networkInfo.isConnected) {
      try {
        final response = await  _rideRemoteDatsourceImp.seachRide(seacrhRideRequest);
        if (response.success!) {
          // success
          // return either right
          // return data 
          
          return Right(response);
        } else {
          // failure --return business error
          // return either left 
         
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {  
      // print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh_____________________________  $error') ;
        
        return Left(Failure(ApiInternalStatus.FAILURE, 'Something went Wrong ' ));
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
    //
 
  }
  
  
