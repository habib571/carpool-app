import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
  FocusNode nameFocusNode = FocusNode();
  final emailcontrollerS = TextEditingController();
  final passwordcontrollerS = TextEditingController();
  final name = TextEditingController();
  final phonenumber = TextEditingController();
  final auth = AuthRemoteDataSourceImp();
  final RegisterUseCase _registerUseCase;
  SignUpController(this._registerUseCase);
  

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
    } 
    else if(!RegExp( r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{6,}$').hasMatch(input)) {  
      return 'Not valid password' ;

    }    
    
    else {
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
    if(input.length==8) { 
      return null ; 
    }
    else { 
      return 'Not valid' ;
    }

  }



  Future<void> register(BuildContext context) async {
      await _registerUseCase.call(
      RegisterRequest(
        email: emailcontrollerS.text.trimLeft(),
        username: name.text.trimLeft(),
        password: passwordcontrollerS.text.trimLeft(),
        gender: gender.value,
        phoneNumber: phonenumber.text,
      ),
    );

  /*  result.fold((failure) {
      StateRenderer(
        title: failure.message,
        stateRendererType: StateRendererType.popupErrorState,
        buttonFunc: () {
          Navigator.pop(context);
        },
      );
    }, (data) {
      if (data.success) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                title: data.message,
                stateRendererType: StateRendererType.popupSuccess,
                buttonFunc: () {
                  Get.to(() => OtpVerificationPage() ,arguments:phonenumber.text );
                },
              );
            });
      } else if (data.message == 'Account already exists') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                title: data.message,
                stateRendererType: StateRendererType.popupErrorState,
                buttonFunc: () {
                  Get.to(() => SignUpPage());
                },
              );
            });
      } else if (data.message == 'email already exists') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                title: data.message,
                stateRendererType: StateRendererType.popupErrorState,
                buttonFunc: () {
                  Get.to(() => SignUpPage());
                },
              );
            });
      } 
      else {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StateRenderer(
                title: data.message,
                stateRendererType: StateRendererType.popupErrorState,
                buttonFunc: () {
                  Get.to(() => SignUpPage());
                },
              );
            });
        
      }
    });*/
  }
}
