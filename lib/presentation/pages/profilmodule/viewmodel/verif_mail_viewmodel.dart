import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailController extends GetxController {
  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  final GlobalKey<FormState> checkformKey = GlobalKey<FormState>();
}
