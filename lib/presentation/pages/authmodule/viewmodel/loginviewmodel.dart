import 'dart:async';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/login_usecase.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../common/state_render_imp.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode sEmailFocusNode = FocusNode();
  FocusNode sPassFocusNode = FocusNode();
  Rx<bool> isLPassObscure = true.obs;
  RxBool onTap = false.obs;
  /* final webController = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)..loadRequest( Uri.parse('http://192.168.1.19:8000/api/google/login')  ,headers:  { 
     'Accept': 'application/json',
          'Content-Type': 'application/json'
  })..setUserAgent('random') ;*/
  final TextEditingController emailcoltrollerL = TextEditingController();
  final TextEditingController passwordcontrollerL = TextEditingController();
  final LoginUsecase _loginUsecase;

  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);
  LoginController(this._loginUsecase);

  FirebaseFirestore firestore =FirebaseFirestore.instance ;

  @override
  void onInit() {
    start();
    super.onInit();
  }

  void start() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState());
  }

  @override
  void onClose() {
    emailcoltrollerL.dispose();
    passwordcontrollerL.dispose();
    stateController.close();
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

  String? validateEmail(String input) {
    if (input.isEmpty) {
      return 'Cannot be empty!';
    } else {
      return null;
    }
  } 

  Future<void> login(BuildContext context) async {
    stateController.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    final result = await _loginUsecase.call(LoginRequest(
        emailcoltrollerL.text.trimRight(),
        passwordcontrollerL.text.trimRight()));
    result.fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (data) async {
      final uid = data.loginData!.user!.uid; 
      final token = data.loginData!.token ;
       Apppreference.setBearerToken(token!) ;
      Apppreference.setUserId(uid!);
      Get.offAllNamed(Approutes.home);
    });
  }

  Future<void> loginGo() async {
    await launchUrl(Uri.parse('http//:192.168.1.12:8000/api/google/login'))
        .then((value) {});
  }
}
