import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/repo_impl.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance; 


Future<void> initAppModule() async { 
  
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker())); 
  instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()) , AuthRemoteDataSourceImp()));

 // if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<SignUpController>(
        () => SignUpController(instance()));
    //instance.registerFactory<ImagePicker>(() => ImagePicker());
 // } 


}