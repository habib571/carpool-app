import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/datasource/remote/userinfo_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/repo_impl.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:carpooling/data/repository/user_info_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/forgot_pass_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_user_data_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/login_usecase.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/logout_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/search_ride_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/update_info_usecase.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/verify_otp.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/forgot_pass_viewmodem.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/loginviewmodel.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/otp_viewmodel.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:carpooling/presentation/pages/notificationmodule/viewmodel/notification_view_model.dart';
import 'package:carpooling/presentation/pages/onboarding/viewmodel/onboardingviewmodel.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/verif_mail_viewmodel.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
import 'package:carpooling/presentation/pages/splash/viewmodel/splashviewmodel.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../presentation/pages/profilmodule/viewmodel/edit_profil_viewmodel.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashControllerImp>(()=>SplashControllerImp());
    Get.lazyPut<OnboardingController>( ()=> OnboardingController());
    Get.lazyPut<LoginController>(   fenix: true , () =>LoginController(LoginUsecase(AuthRepositoryImp(
        NetworkInfoImpl(InternetConnectionChecker()),
        AuthRemoteDataSourceImp()))));
    Get.put<ForgotPasswordcontroller>(ForgotPasswordcontroller(
      ForgotUseCase(AuthRepositoryImp(
          NetworkInfoImpl(InternetConnectionChecker()),
          AuthRemoteDataSourceImp())),
    ));
    Get.lazyPut<SignUpController>( fenix: true ,() =>SignUpController(RegisterUseCase(
        AuthRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()),
            AuthRemoteDataSourceImp()))));
    Get.put<OtpVerificationController>(OtpVerificationController(
        VerifyOtpUseCase(AuthRepositoryImp(
            NetworkInfoImpl(InternetConnectionChecker()),
            AuthRemoteDataSourceImp()))));


    Get.lazyPut<ProfilController>( fenix :true ,()=> ProfilController(LogoutUseCase(UserInfoRepositpryImp(UserInfoRemoteDataSourceImp(),NetworkInfoImpl(InternetConnectionChecker()))) , GetUserDataUseCase(UserInfoRepositpryImp(UserInfoRemoteDataSourceImp(),NetworkInfoImpl(InternetConnectionChecker())))) , ) ; 
    Get.put<CheckEmailController>(CheckEmailController()) ; 
    Get.lazyPut<EditProfilController>( fenix: true , ()=> EditProfilController(UpdateInfoUsecae(UserInfoRepositpryImp(UserInfoRemoteDataSourceImp() ,NetworkInfoImpl(InternetConnectionChecker()))) ) )  ; 
  //Get.lazyPut(fenix: true , ()=> RideInfoController(GetRidesUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()),RideRemoteDatsourceImp()))))  ; 
    Get.lazyPut( fenix: true , ()=> SearchRideController(SearchRideUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()), RideRemoteDatsourceImp())))) ;
    Get.lazyPut( fenix: true  ,() => NotificationController() ) ;
      }
}

