import 'dart:async';

import 'package:get/get.dart';

import '../../../../domain/models/user.dart';
import '../../../../domain/usecases/auth_usecase.dart/get_user_data_use_case.dart';
import '../../../common/state_render.dart';
import '../../../common/state_render_imp.dart';
import 'ride_details_viewmodel.dart';

class DrivertProfileController extends GetxController {
  final RideDetailsController _ctx = Get.find();
  @override
  void onInit() {
    start();
    super.onInit();
  }

  void start() {
    _stateStream = stateController.stream.asBroadcastStream();
    getDriverData() ;

  }

  User? user;
 

  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);

  final GetUserDataUseCase _getUserDataUseCase;
  DrivertProfileController(this._getUserDataUseCase);
  getDriverData() async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _getUserDataUseCase.getUserData('00337a30-c786-4d75-a49d-0088d2e03cbb')).fold(
        (failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure));
    }, (data) {  
      stateController.add(ContentState());
       user = data.userData!.user! ;

    });
  }
}
