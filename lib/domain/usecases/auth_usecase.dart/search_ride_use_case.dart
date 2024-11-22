import 'package:carpooling/data/network/failure.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/search_ride_response.dart';
import 'package:carpooling/domain/repository/rides_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRideUseCase { 
  final RidesRepository _ridesRepository ; 
  SearchRideUseCase(this._ridesRepository) ;
  Future<Either<Failure , RidesResponse>> searchRide(SeacrhRideRequest seacrhRideRequest ) async { 
     return await _ridesRepository.searchRide(seacrhRideRequest) ;
  }
}