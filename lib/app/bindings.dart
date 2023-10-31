import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/forgot_pass_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/login_usecase.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/verify_otp.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/forgot_pass_viewmodem.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/loginviewmodel.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/otp_viewmodel.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:carpooling/presentation/pages/homemodule/viewmodel/edit_profil_view_model.dart';
import 'package:carpooling/presentation/pages/onboarding/viewmodel/onboardingviewmodel.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/viewmodel/searchride_viewmodel.dart';
import 'package:carpooling/presentation/pages/sharidemodule/viewmodel/ride_form_viewmodel.dart';
import 'package:carpooling/presentation/pages/splash/viewmodel/splashviewmodel.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashControllerImp>(SplashControllerImp());
    Get.put<OnboardingController>(OnboardingController());
    Get.put<LoginController>(LoginController(LoginUsecase(AuthRepositoryImp(
        NetworkInfoImpl(InternetConnectionChecker()),
        AuthRemoteDataSourceImp()))));
    Get.put<ForgotPasswordcontroller>(ForgotPasswordcontroller(
      ForgotUseCase(AuthRepositoryImp(
          NetworkInfoImpl(InternetConnectionChecker()),
          AuthRemoteDataSourceImp())),
    ));
    Get.put<SignUpController>(SignUpController(RegisterUseCase(
        AuthRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()),
            AuthRemoteDataSourceImp()))));
    Get.put<OtpVerificationController>(OtpVerificationController(
        VerifyOtpUseCase(AuthRepositoryImp(
            NetworkInfoImpl(InternetConnectionChecker()),
            AuthRemoteDataSourceImp()))));
    Get.put<EditProfilController>(EditProfilController()); 
    Get.put<RideFormController>(RideFormController()) ; 
    Get.put<SearchRideController>(SearchRideController()) ;
  }
}
