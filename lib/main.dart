
import 'package:carpooling/app/bindings.dart';
import 'package:carpooling/navigation/routes.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sharedPrefs ; 
late FlutterSecureStorage storage ;
void main() async{ 
 WidgetsFlutterBinding.ensureInitialized();  
 
 sharedPrefs = await SharedPreferences.getInstance(); 
 AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  storage = FlutterSecureStorage(aOptions: getAndroidOptions());
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp( 
       debugShowCheckedModeBanner: false, 
       theme: AppThemes.lightTheme,
        initialBinding: AppBindings(),
        //darkTheme: AppThemes.darkTheme, 
          initialRoute:Approutes.splash ,
          getPages: routes,      
         
    );
  }
}

