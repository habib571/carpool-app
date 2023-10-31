import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {  
  final GlobalKey<FormState> resetformKey = GlobalKey<FormState>();
  final passController = TextEditingController() ; 
  final passConfirmController = TextEditingController() ;
  FocusNode passwordFocusNode =  FocusNode() ;
  FocusNode passwoedconfFocusNode = FocusNode() ;
  Rx<bool> isSPassObscure = true.obs;
  Rx<bool> isconfirmPassObscure = true.obs; 
  @override
  void onClose() {
   passConfirmController.dispose() ; 
   passController.dispose() ;
    super.onClose();
  }
  String? validatePassword(String input) {
    if (input.isEmpty) {
      return 'Cannot be Empty !';
    } else if (!RegExp(
            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{6,}$')
        .hasMatch(input)) {
      return 'Not valid password';
    } else {
      return null;
    }
  } 



}