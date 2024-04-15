import 'package:carpooling/data/responses/base_response.dart';
import 'package:carpooling/domain/repository/rides_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';

class BookRideUseCase  { 
   final RidesRepository _ridesRepository ; 
  BookRideUseCase(this._ridesRepository) ; 
   Future<Either<Failure ,BaseResponse>> bookRide( int id )  async{ 
     return await _ridesRepository.bookRide(id) ;
   }
}