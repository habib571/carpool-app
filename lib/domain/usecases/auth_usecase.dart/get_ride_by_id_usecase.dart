import 'package:carpooling/data/responses/rides_responses.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../repository/rides_repository.dart';

class GetRideByIdUseCase { 
    final RidesRepository _ridesRepository ;  
    GetRideByIdUseCase(this._ridesRepository) ; 
     Future<Either<Failure , RideResponse>>  getRideById(int id) async{ 
       return await  _ridesRepository.getRideById(id) ;
     }

}