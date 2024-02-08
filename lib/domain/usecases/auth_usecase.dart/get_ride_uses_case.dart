import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:dartz/dartz.dart';

import '../../repository/rides_repository.dart';

class GetRidesUseCase { 
  final RidesRepository  _ridesRepository;  
  GetRidesUseCase(this._ridesRepository)  ;
  Future<Either<Failure , RideResponse>> getLatestRide() async {  
    return await  _ridesRepository.getLatestRide() ; 
  } 
   


   Future<Either<Failure , BaseResponse>> deletRide(String rideId) async {  
    return await  _ridesRepository.deleteRide(rideId) ;
   }
   
} 