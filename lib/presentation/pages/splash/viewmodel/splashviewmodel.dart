
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 



class SplashControllerImp extends GetxController {  
 RxBool isSplashExpanded = true.obs;
 late AnimationController splashAnimationController;
 Duration splashTransitionDuration = const Duration(seconds: 1);
 
  
}