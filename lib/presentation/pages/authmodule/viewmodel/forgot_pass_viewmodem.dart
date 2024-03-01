// ignore_for_file: avoid_print

import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/forgot_pass_use_case.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/reset_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class ForgotPasswordcontroller extends GetxController {
  final GlobalKey<FormState> forgotformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetformKey = GlobalKey<FormState>();
  FocusNode fEmailFocusNode = FocusNode();
  final fEmailcontroller = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwoedconfFocusNode = FocusNode();
  Rx<bool> isSPassObscure = true.obs;
  Rx<bool> isconfirmPassObscure = true.obs;
  final ForgotUseCase _forgotUseCase;
  String email = '';
  String token = '';
  ForgotPasswordcontroller(this._forgotUseCase);
  @override
  void onClose() {
    fEmailcontroller.dispose();
    super.onClose();
  }

@override
  void onInit() {
    initUniLinks() ;
    super.onInit();
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

  /*Future<void> sendEmail(BuildContext context) async {
    final result = await _forgotUseCase.call(fEmailcontroller.text.trimRight());

    result.fold((falilure) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
                title: 'ERROR',
                message: falilure.message,
                stateRendererType: StateRendererType.popupErrorState,
                retryActionFunction: () {
                  Navigator.of(context).pop();
                });
          });
    }, (data) {
      if (data.success!) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                  message: data.message!.toString(),
                  stateRendererType: StateRendererType.popupSuccess,
                   retryActionFunction: () async{  
               
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  });
            });
      } else {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                  title: 'ERROR',
                  message: data.message!.toString(),
                  stateRendererType: StateRendererType.popupErrorState,
                  retryActionFunction: () async{
                
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  });
            });
      }
    });
  }*/

  Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
    // print("eaifrg liiiinkkkkk $initialLink") ;
      handleDeepLink(initialLink);
    } on PlatformException {
      print('erorrrrrrrrrrrrrrrrrt') ;
    }

    // Listen for deep links while the app is running.
    linkStream.listen((String? link) {
      handleDeepLink(link);
    });
  }

  void handleDeepLink(String? link) {
    if (link != null) {
      Uri uri = Uri.parse(link);
      token = uri.queryParameters['token']!;
      Get.to(() => ResetPasswordPage());
    }
  }

  Future<void> resetpassword() async {
    final result = await _forgotUseCase.resetCall(ResetPasswordRequest(
        email,
        passController.text.trimRight(),
        passConfirmController.text.trimRight(),
        token));
    result.fold(
        (failure) => print(failure.message), (data) => print(data.message)
        );
  }
}
