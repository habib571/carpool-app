import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authmiddleware extends GetMiddleware {
  @override 
  RouteSettings? redirect(String? route) { 
    // ignore: unrelated_type_equality_checks
    if(Apppreference.getLoginoken() !='') return const RouteSettings( name: Approutes.home);
    return null;
    

  }

}