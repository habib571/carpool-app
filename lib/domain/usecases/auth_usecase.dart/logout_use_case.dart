import 'package:carpooling/domain/repository/user_info_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../../data/responses/auth_response.dart';

class LogoutUseCase { 
  final UserInfoRepositpry _infoRepositpry;  
  LogoutUseCase(this._infoRepositpry) ;  
  Future<Either<Failure, AuthResponse>> call() async{
      return await _infoRepositpry.logout() ;
    }

}