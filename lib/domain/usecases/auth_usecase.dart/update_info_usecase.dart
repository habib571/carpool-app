import 'package:carpooling/data/network/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/requests.dart';
import '../../../data/responses/auth_response.dart';
import '../../repository/user_info_repo.dart';

class UpdateInfoUsecae {
  final UserInfoRepositpry _infoRepositpry;  
  UpdateInfoUsecae(this._infoRepositpry ) ;
    Future<Either<Failure, AuthResponse>> updateInfo(UpdateInfoRequest updateInfoRequest) async {  
      return await _infoRepositpry.updateInfo(updateInfoRequest) ;

    } 
     Future<Either<Failure, AuthResponse>> updatePicture(String imagePath) async {  
      return await _infoRepositpry.updatePicture(imagePath) ;

    } 


}