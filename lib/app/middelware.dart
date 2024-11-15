// ignore_for_file: unnecessary_null_comparison

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authmiddleware extends GetMiddleware {
    


  @override
  RouteSettings? redirect(String? route) { 
    if (Apppreference.getLogin() == "1") {
      return const RouteSettings(name: Approutes.home);
    }
    return null;
  }
}
