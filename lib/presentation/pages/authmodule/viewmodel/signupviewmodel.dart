import 'dart:async';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../common/state_render.dart';
import '../../../common/state_render_imp.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> pohneNumberformKey = GlobalKey<FormState>();
  RxString gender = 'male'.obs;
  Rx<bool> isSPassObscure = true.obs;
  Rx<bool> isconfirmPassObscure = true.obs;
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  FocusNode confirmpassFocusNode = FocusNode();
  FocusNode firstFocusNode = FocusNode();
  FocusNode lastFocusNode = FocusNode();
  final emailcontrollerS = TextEditingController();
  final passwordcontrollerS = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phonenumber = TextEditingController();
  final auth = AuthRemoteDataSourceImp();
  final RegisterUseCase _registerUseCase;
  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);
  SignUpController(this._registerUseCase);

  @override
  void onInit() {
    start();
    super.onInit();
  }

  start() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState());
  }

  String? validateName(String input) {
    if (input.isEmpty) {
      return 'Cannot be Empty !';
    } else if (input.length > 10) {
      return 'Username must be less than 10 caracter';
    } else {
      return null;
    }
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

  String? validatePhoneNumber(String input) {
    if (input.length == 8) {
      return null;
    } else {
      return 'Not valid';
    }
  }

  Future<void> register(BuildContext context) async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    final result = await _registerUseCase.call(
      RegisterRequest(
        email: emailcontrollerS.text.trimLeft(),
        firstname: firstname.text.trimLeft(),
        lastname: firstname.text.trimLeft(),
        password: passwordcontrollerS.text.trimLeft(),
        gender: gender.value,
        phoneNumber: phonenumber.text,
      ),
    );

    result.fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.snackbarState, failure.message));
    }, (success) {
      Apppreference.setBearerToken(success.data!['token']);
      Get.offAllNamed(Approutes.verifyOtp, arguments: phonenumber.text);
    });
  }
}
