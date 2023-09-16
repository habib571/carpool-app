import 'package:flutter/material.dart';
import 'package:get/get.dart';


 class LoginController extends GetxController { 

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode sEmailFocusNode=FocusNode();
  FocusNode sPassFocusNode=FocusNode();
  Rx<bool> isLPassObscure  = true.obs;
  RxBool onTap = false.obs; 
  final TextEditingController emailcoltrollerL = TextEditingController() ;  
  final TextEditingController  passwordcontrollerL = TextEditingController() ;
 
 }