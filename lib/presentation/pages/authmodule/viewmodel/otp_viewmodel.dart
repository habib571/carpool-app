import 'dart:async';

import 'package:carpooling/domain/usecases/auth_usecase.dart/verify_otp.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final VerifyOtpUseCase _verify;
  late Timer _timer;
  RxInt start = 60.obs;
  RxBool isLoading = false.obs;
  OtpVerificationController(this._verify);
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    otpController.dispose();
    _timer.cancel();
    super.onClose();
  }

  verifyOtp(BuildContext context) async {
    final result = await _verify.call(otpController.text);
    result.fold((failure) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              message: failure.message,
              stateRendererType: StateRendererType.popupErrorState,
              buttonFunc: () {
                Navigator.of(context).pop();
              },
            );
          });
    }, (data) {
      //    print(otpController.text) ;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              message: data.message,
              stateRendererType: data.success
                  ? StateRendererType.popupSuccess
                  : StateRendererType.popupErrorState,
              buttonFunc: () {
                Get.to(() => LoginPage());
              },
            );
          });
    });
  }

  resendOtp(String number, BuildContext context) async {
    final result = await _verify.resendCall(number);
    result.fold((failure) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              message: failure.message,
              stateRendererType: StateRendererType.popupErrorState,
              buttonFunc: () {
                Navigator.of(context).pop();
              },
            );
          });
    }, (data) {  
      if(data.success)  {
        startTimer(); 
      }
      else { 
              showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              message: data.message,
              stateRendererType: StateRendererType.popupErrorState,
              buttonFunc: () {
                Navigator.of(context).pop();
              },
            );
          });
      }
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          isLoading.value = false;
        } else {
          start.value--;
        }
      },
    );
  }

  String? otpValidate(String input) {
    if (input.length == 6) {
      return null;
    } else {
      return 'verification code must be 6 numbers';
    }
  }
}
