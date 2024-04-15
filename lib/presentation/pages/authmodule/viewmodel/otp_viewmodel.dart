import 'dart:async';

import 'package:carpooling/domain/usecases/auth_usecase.dart/verify_otp.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/state_render_imp.dart';

class OtpVerificationController extends GetxController {
  final SignUpController _controller = Get.find();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final VerifyOtpUseCase _verify;
  late Timer _timer;
  RxInt start = 60.obs;
  RxBool isLoading = false.obs;
  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);
  OtpVerificationController(this._verify);
  @override
  void onInit() {
    startTimer();
    sTart();
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    stateController.close() ;
    super.onClose();
  }

  void sTart() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState());
  }

  verifyOtp() async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _verify.call(otpController.text)).fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (data) {
      //    print(otpController.text) ;
      Get.offAllNamed(Approutes.login);
    });
  }

  resendOtp() async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    final result = await _verify.resendCall(_controller.phonenumber.text);
    result.fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (data) {
      startTimer();
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
