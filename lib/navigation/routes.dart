import 'package:carpooling/app/middelware.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/forgot_screen.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/gender_select_page.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/loginpage.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/phone_number.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/reset_pass_screen.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/signup.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/verif_otp_page.dart';
import 'package:carpooling/presentation/pages/homemodule/view/screens/homescreen.dart';
import 'package:carpooling/presentation/pages/onboarding/view/onbardingscreen.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/screens/edit_mode_screen.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/screens/myprofil_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/slelect_date_screen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/loacation_scree.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/share_ride_screen.dart';
import 'package:carpooling/presentation/pages/splash/view/splashscreen.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [ 
  GetPage(name: Approutes.splash ,page:  () => const SplashPage() ) ,
  GetPage(name: Approutes.onboarding, page:  () =>  OnboardinScreen()) ,
  GetPage(name: Approutes.login, page:  () =>  LoginPage() , middlewares:[Authmiddleware()]),
  GetPage(name: Approutes.signup, page:  () => SignUpPage()) , 
  GetPage(name: Approutes.home, page: ()=> const HomeScreen()) ,
  GetPage(name: Approutes.editprofil , page: ()=>   EditModeScreen() ) , 
  GetPage(name: Approutes.profil, page: ()=>  ProfilMode()) ,
  GetPage(name: Approutes.confirmloction, page: ()=>  const LocationScren()) , 
  GetPage(name: Approutes.dateSelection, page: ()=> SelectDateScreen() ) , 
  //GetPage(name: Approutes.timeSelection ,page: ()=> const TimePickerScreen())  ,
  GetPage(name: Approutes.phonenNumber, page: () =>PhoneNumberPage() )  ,
  GetPage(name: Approutes.resetpass, page:()=> ResetPasswordPage()) ,
  GetPage(name: Approutes.verifyOtp, page: ()=> OtpVerificationPage())  ,
  //GetPage(name: Approutes.googleLogin, page: ()=> GooglAuthScreen())  ,
  GetPage(name: Approutes.forgetpass, page: ()=>const ForgotPassPage()) , 
  GetPage(name: Approutes.selelectgender, page: ()=>GenderPage()) ,
  GetPage(name: Approutes.shareride ,page:()=> ShareRideScreen() )
  ]; 



