
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/login_usecase.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode sEmailFocusNode = FocusNode();
  FocusNode sPassFocusNode = FocusNode();
  Rx<bool> isLPassObscure = true.obs;
  RxBool onTap = false.obs;
  final TextEditingController emailcoltrollerL = TextEditingController();
  final TextEditingController passwordcontrollerL = TextEditingController();
  final LoginUsecase _loginUsecase;
  LoginController(this._loginUsecase);
  @override
  void onClose() {
    emailcoltrollerL.dispose();
    passwordcontrollerL.dispose();
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
    final result = await _loginUsecase.call(LoginRequest(
        emailcoltrollerL.text.trimRight(),
        passwordcontrollerL.text.trimRight()));
    result.fold((failure) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
                stateRendererType: StateRendererType.popupErrorState,
                buttonFunc: () {
                  Navigator.of(context).pop();
                });
          });
    }, (data) {
      if (data.success) { 
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                  stateRendererType: StateRendererType.popupSuccess,
                  message: data.message,
                  buttonFunc: () {
                    Navigator.of(context).pop();
                  });
            });
      } else {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                  stateRendererType: StateRendererType.popupErrorState,
                  message: data.message,
                  buttonFunc: () {
                    Navigator.of(context).pop();
                  });
            });
      }
    });
  }
}
