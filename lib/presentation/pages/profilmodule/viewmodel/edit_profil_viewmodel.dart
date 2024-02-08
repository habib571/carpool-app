import 'dart:async';
import 'package:carpooling/data/network/requests.dart';
import 'package:carpooling/presentation/common/state_render.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/usecases/auth_usecase.dart/update_info_usecase.dart';
import '../../../common/state_render_imp.dart';

class EditProfilController extends GetxController {
  FocusNode lnameFocusNode = FocusNode();
  FocusNode fnameFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final ProfilController controller = Get.find();

  EditProfilController(this._updateInfoUsecae);
  final UpdateInfoUsecae _updateInfoUsecae;
  RxString fname = ''.obs;
  RxString lname = ''.obs;
  RxString gender = ''.obs;
  RxBool modifMode = false.obs;
  RxString imagePath = ''.obs;

  final stateController = StreamController<FlowState>();
  late Stream<FlowState> _stateStream;
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);

  handleGender() {
    gender.value = controller.user!.gender!;
  }

  void switchMode() {
    modifMode.value = !modifMode.value;
  }

  updateInfo() async {
    (await _updateInfoUsecae.updateInfo(
            UpdateInfoRequest(fname.value, lname.value, gender.value)))
        .fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (data) {
      controller.getData();
    });
  }

  updatePicure(String imagePath) async {
    (await _updateInfoUsecae.updatePicture(imagePath)).fold(
        (l) {},
        (r) => {
              controller.getData(),
            });
  }

  @override
  void onInit() {
    start();

    handleGender();

    super.onInit();
  }

  void start() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState());
  }
}
