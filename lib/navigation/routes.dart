import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/loginpage.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/signup.dart';
import 'package:carpooling/presentation/pages/onboarding/view/onbardingscreen.dart';
import 'package:carpooling/presentation/pages/splash/view/splashscreen.dart';
import 'package:get/get.dart';

class Approuter {

static final routes = [
  GetPage(name: Approutes.splash ,page:  () => const SplashPage() ) ,
  GetPage(name: Approutes.onboarding, page:  () =>  OnboardinScreen()) ,
  GetPage(name: Approutes.login, page:  () =>  LoginPage()),
  GetPage(name: Approutes.signup, page:  () => SignUpPage()) ,

  ]; 



}