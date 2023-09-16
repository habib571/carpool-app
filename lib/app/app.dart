import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  const MyApp._intrenal() ;
  static const MyApp _instance = MyApp._intrenal() ; 
  factory MyApp() => _instance ;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
    
    );
  }
}
