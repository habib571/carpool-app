import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  
  final usernameC = TextEditingController();
  final age = TextEditingController();
  final phoneNumber = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();  
  Rx<GenderSelect> gender = GenderSelect.male.obs ;


}  

enum GenderSelect { male, female}