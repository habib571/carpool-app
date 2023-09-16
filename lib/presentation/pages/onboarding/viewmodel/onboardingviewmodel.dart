import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController  { 
  PageController welcomePageController = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  final int count = 3;  
    RxBool isSkipDark=false.obs;
  RxBool isLoginLight=false.obs;

}