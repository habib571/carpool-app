
import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/data/repository/repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:carpooling/presentation/common/state_render_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {  
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  String phoneNumber='';
  String forgetEmail='';
   Rx<bool> isSPassObscure  = true.obs;
   Rx<bool> isconfirmPassObscure  = true.obs;
  RxBool isMale=true.obs;
 /* FocusNode emailFocusNode=FocusNode();
  FocusNode passFocusNode=FocusNode();
  FocusNode confirmpassFocusNode=FocusNode();
  FocusNode nameFocusNode = FocusNode(); */
  final emailcoltrollerS = TextEditingController() ;  
  final passwordcontrollerS = TextEditingController() ;
  final name = TextEditingController() ; 
  final auth = AuthRemoteDataSourceImp() ;
  final  RegisterUseCase _registerUseCase ;
  SignUpController(this._registerUseCase) ;
@override
  void onClose() {
   name.dispose() ; 
   passwordcontrollerS.dispose() ; 
   emailcoltrollerS.dispose() ;
    super.onClose();
  } 


register() async { 
 (  await _registerUseCase.call(
 RegisterRequest(
  emailcoltrollerS.text.trim(),
  name.text.trim(), 
  passwordcontrollerS.text.trim() 
  ))).fold((failure) =>
                     print(failure.code), (data) => print(data));
    

}
} 