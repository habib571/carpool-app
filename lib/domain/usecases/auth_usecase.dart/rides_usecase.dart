import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/domain/repository/rides_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/requests.dart';
import '../../../data/responses/base_response.dart';

class CreateRideUseCase { 
  final RidesRepository  _ridesRepository; 
  CreateRideUseCase(this._ridesRepository) ; 
  Future<Either<Failure,BaseResponse>> createRide(ShareRideRequest shareRideRequest)  { 
      return _ridesRepository.createRide(shareRideRequest) ;
  }
}