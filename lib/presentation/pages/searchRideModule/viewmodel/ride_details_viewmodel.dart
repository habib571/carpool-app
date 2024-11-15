import 'dart:async';

import 'package:carpooling/domain/usecases/auth_usecase.dart/book_ride_use_case.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/app_prefs.dart';
import '../../../../domain/models/notification.dart';
import '../../../../domain/models/ride.dart';
import '../../../common/state_render.dart';
import '../../../common/state_render_imp.dart';
import '../../profilmodule/viewmodel/profil_viewmodel.dart';

class RideDetailsController extends GetxController {
  @override
  void onInit() {
    start();
    super.onInit();
  }

  void start() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState());
  }

  final ProfilController _ctx = Get.find();
  final SearchRideController searchController = Get.find() ;


  final BookRideUseCase _bookRideUseCase;
  RideDetailsController(this._bookRideUseCase);
  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void bookRide() async {
    stateController.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _bookRideUseCase.bookRide(searchController.ride.id!)).fold((failure) {
      stateController
          .add(ErrorState(StateRendererType.popupErrorState, failure.message));
    }, (data) {
      stateController.add(SuccessState(data.message!)); 
       sendNotificationTodriver() ;
    });
  }

  sendNotificationTodriver() async {
    final uid = await Apppreference.getUserId();
    const String description = " want to join your Ride !";

    Notifi notification = Notifi(
      fromId: uid,
      toId: searchController.ride.driverId,
      rideId: searchController.ride.id,
      senderName: "${_ctx.user!.firstName} ${_ctx.user!.lastName} ",
      description: description,
      isRequest: true,
    // time: DateTime.now(),
      senderPhotoUrl: _ctx.user!.picture,
    ); 
    return await firestore
       .collection('notifications')
       .add(notification.toJson()) ;
  }

  void callDriver() async {
    final call = Uri.parse('tel:+216 23876237');
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }
}
