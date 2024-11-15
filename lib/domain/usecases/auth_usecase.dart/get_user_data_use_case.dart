import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/responses/auth_response.dart';
import 'package:carpooling/data/responses/user_data_response.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../repository/user_info_repo.dart';

class GetUserDataUseCase  { 
 final UserInfoRepositpry _infoRepositpry;  
   GetUserDataUseCase(this._infoRepositpry) ; 
   Future<Either<String, UserResponse>> getUserData(String uid) async{
      return await _infoRepositpry.getUserData(uid) ;
    }  
  
  Future<Either<Failure, AuthResponse>> updateCall(String bio) async {  
    return await _infoRepositpry.addMiniBio(bio) ;

  }  

    Future<Either<Failure, AuthResponse>> updateInfo(UpdateInfoRequest updateInfoRequest) async {  
      return await _infoRepositpry.updateInfo(updateInfoRequest) ;

    }
   
  

}
