
import 'package:carpooling/app/bindings.dart';
import 'package:carpooling/presentation/pages/homemodule/view/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sharedPrefs ;
void main() async{ 
 WidgetsFlutterBinding.ensureInitialized(); 
 sharedPrefs = await SharedPreferences.getInstance();
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
          debugShowCheckedModeBanner: false, 
          //theme: AppThemes.lightTheme,
          initialBinding: AppBindings(),
         // darkTheme: AppThemes.darkTheme, 
          home: const HomeScreen(),
    );
  }
}

