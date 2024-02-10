import 'dart:async';

import 'package:carpooling/app/app_prefs.dart';
import 'package:carpooling/domain/models/user.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_user_data_use_case.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/logout_use_case.dart';
import 'package:carpooling/presentation/common/state_render_imp.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/state_render.dart';

class ProfilController extends GetxController {
  FocusNode lnameFocusNode = FocusNode();
  FocusNode fnameFocusNode = FocusNode();

  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode bioFocusNode = FocusNode();

  FocusNode carBrandfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final LogoutUseCase _logoutUseCase;
  final GetUserDataUseCase _dataUseCase;
  final stateController = StreamController<FlowState>();
  late Stream<FlowState> _stateStream;
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);
   User? user;

  String fname =  '' ; 
  String lname = '' ; 
  RxString gender = 'male'.obs ;
  RxBool modifMode =  false.obs ; 
 
  ProfilController(this._logoutUseCase, this._dataUseCase);
  



  start() {
    getData(); 
  } 

  _handleGender() { 
    gender.value = user!.gender! ;
  }
  
void switchMode() { 
    modifMode.value = !modifMode.value ;  
    if(modifMode.value) { 
    _handleGender() ;
    }
    
 } 



  Future<void> getData() async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _dataUseCase.call()).fold(
      (failure) {
        stateController.add(ErrorState(
            StateRendererType.fullScreenErrorState, "falure"));
      },
      (data) {
        stateController.add(ContentState());
        user = data.userData!.user!; 
        update() ;
      },
    );
  } 

 


/*Future<void> addMinioBio( BuildContext context ,) async{   
  

    final result = await _dataUseCase.updateCall(bioController.text.trimLeft()) ;
    result.fold((failure) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer( 
              message:  failure.message,
                stateRendererType: StateRendererType.popupErrorState,
                 retryActionFunction: ()  {
                  Navigator.pop(context) ;
                 },
               );
          });
    }, (data) async { 
        start() ;
        update() ;
    }); 



}*/

  Future<void> logout(BuildContext context) async {
    final result = await _logoutUseCase.call();
    result.fold((failure) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StateRenderer(
              stateRendererType: StateRendererType.popupErrorState,
              retryActionFunction: () {},
            );
          });
    }, (data) async {
      await Apppreference.removeLoginToken();
      Get.off(() => LoginPage());
    });
  }
  /* uploadPicture( ImageSource source)async { 
      final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    
    if (image != null) {
      imagePath.value = image.path;
      Get.back(); // for hiding the bottom sheet using GetX
  }}*/

  @override
  void onInit() {
    _stateStream = stateController.stream.asBroadcastStream();
    start();
    super.onInit();
  }

  @override
  void onClose() {
    stateController.close();
    super.onClose();
  }
}
