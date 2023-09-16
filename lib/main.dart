import 'package:carpooling/app/di.dart';
import 'package:carpooling/presentation/pages/splash/view/splashscreen.dart';
import 'package:carpooling/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

void main() async{ 
   WidgetsFlutterBinding.ensureInitialized(); 
  // await initAppModule() ;
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
          debugShowCheckedModeBanner: false, 
          theme: AppThemes.lightTheme,
         // darkTheme: AppThemes.darkTheme, 
          home: const SplashPage(),

    
    );
  }
}

