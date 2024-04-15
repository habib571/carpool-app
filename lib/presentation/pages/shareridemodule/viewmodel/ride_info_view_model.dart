import 'dart:async';
import 'package:carpooling/domain/models/ride.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_ride_uses_case.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/pages/homemodule/view/screens/homescreen.dart';
import 'package:get/get.dart';
import '../../../common/state_render.dart';
import '../../../common/state_render_imp.dart';
class RideInfoController extends GetxController {   
    @override
  void onInit() {
    start() ;
    super.onInit();
  } 
    Ride? ride ;  
    @override
  void onClose() {
      stateController.close() ;
    super.onClose();
  } 

  
      final stateController = StreamController<FlowState>();
  late Stream<FlowState> _stateStream;
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);
      
     void start() {   
      getLatestRide() ;
      _stateStream = stateController.stream.asBroadcastStream(); 
     stateController.add(ContentState()) ;
  }

 final  GetRidesUseCase _getRidesUseCase ; 
   RideInfoController(this._getRidesUseCase) ; 
   getLatestRide() async{ 
    stateController.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState)) ;
    (
      await _getRidesUseCase.getLatestRide()
    ).fold((failure) => stateController.add(ErrorState(StateRendererType.popupErrorState, failure.message)), 
    (data) {
    ride = data.rideData!.ride!  ;  
    update() ;     
    } ) ;
   } 
   deletRide() async  { 
        stateController.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState)) ;
    (
      await _getRidesUseCase.deletRide(ride!.id.toString())
    ).fold((failure) => stateController.add(ErrorState(StateRendererType.popupErrorState, failure.message)), 
    (data) {  
  
      Get.offAndToNamed(Approutes.home) ;
    } );
   }
   
} 