import 'package:carpooling/domain/repository/rides_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../../data/responses/base_response.dart';

class AcceptPassengerUserCase {
   final RidesRepository _ridesRepository ; 
   AcceptPassengerUserCase(this._ridesRepository) ; 
   Future<Either<Failure ,BaseResponse>> acceptPassenger(int rideId , String passengerId )  async{
     return await _ridesRepository.acceptPassenger(rideId, passengerId) ;
   }
}