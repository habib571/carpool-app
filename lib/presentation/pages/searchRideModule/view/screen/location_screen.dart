
import 'dart:async';

import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/maps/loaction_form.dart';
import 'package:carpooling/presentation/pages/maps/mapview.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../data/network/network_info.dart';
import '../../../../../data/repository/rides_repo_impl.dart';
import '../../../../../domain/usecases/auth_usecase.dart/search_ride_use_case.dart';
import '../../../../common/state_render_imp.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> { 
  final SearchRideController _controller = Get.find() ;
  @override
  void initState() { 
   _controller.getCurrentLocation() ;
 
    super.initState();
  } 
  @override
  void dispose() {
    _controller.mapController = Completer();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>( 
          stream:_controller.outputState,
          builder:(context ,snapshot) {
             return snapshot.data?.getScreenWidget(context, _showBody(), () {_controller.start() ;} ) ?? 
             _showBody() ;
           
          }
           )
    );
  }

  Widget _showBody() {
    return Stack(
      children: [_showMap(), _showLocationSection()],
    );
  }

  Widget _showLocationSection() {
    return Form(
      key: _controller.locationformKey,
      child: GetX<SearchRideController>(builder: (_) {
        return LocationForm(
            validator: (val) {
              if (val!.isEmpty) {
                return 'cannot be null';
              }
              return '';
            },
            destinationFocusNode: _controller.arriveFocusNode,
            startFocusNode: _controller.startFocusNode,
            startAddressController: _controller.departController,
            destinationController: _controller.arriveController,
            draggableScrollableController: _controller.scrollableController,
            startaddress: _controller.startaddress.value,
            destinationAddress: _controller.destinationAddress.value,
            items: _.disablePrediction.value
                ? ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          indent: 2,
                          color: AppColors.greyColor,
                          thickness: 1,
                        ),
                    itemCount: _controller.placeList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          _controller.startFocusNode.hasFocus
                              ? _controller.departController.text =
                                  _.placeList[index]["description"]
                              : _controller.arriveController.text =
                                  _.placeList[index]["description"];
                          _controller.startFocusNode.hasFocus
                              ? _controller.startaddress.value =
                                  _controller.departController.text
                              : _controller.destinationAddress.value =
                                  _controller.arriveController.text;

                          _.disablePrediction.value = false;

                          if (_controller.arriveController.text.isNotEmpty ) {   
                             _controller.calculateDistance() ;
                              
                            _controller.scrollableController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut,
                            );
                          } 
                             if (_.markers.isNotEmpty) _.markers.clear();
                                      if (_.polylines.isNotEmpty) {
                                        _.polylines.clear();
                                      }
                                      if (_.polylineCoordinates.isNotEmpty) {
                                       _.polylineCoordinates.clear();
                                      } 
                                      _.placeDistance = 0.0.obs;
                        },
                        title: Text(
                          _.placeList[index]["description"],
                          style: const TextStyle(color: Colors.black),
                        ),
                        leading: SvgPicture.asset("assets/icons/loc.svg"),
                      );
                    })
                : const SizedBox(),
            onTxtTap: () {
              _controller.disablePrediction.value = true;
              _controller.scrollableController.animateTo(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut,
              );
            },
            confirmButt:
                !_.disablePrediction.value && _.arriveController.text.isNotEmpty
                    ? PrimaryButton(
                        text: 'Confirmer',
                        onPressed: () {  
                          // _controller.calculateDistance() ;
                         
                           Get.back() ;                          
                        })
                    : const SizedBox(),
            cancelButt: _.disablePrediction.value
                ? IconButton(
                    onPressed: () {
                      _.disablePrediction.value = false;

                      if (_controller.arriveController.text.isNotEmpty) {
                        _controller.scrollableController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut,
                        );
                      }
                    },
                    icon: const Icon(Icons.cancel))
                : const SizedBox());
      }),
    );
  }

  Widget _showMap() {
    return GetBuilder<SearchRideController>( 
      init: SearchRideController(SearchRideUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()), RideRemoteDatsourceImp()))) ,
      builder: (_) {
        return MapView(
            onMapcreated: (controller) { 
            
           
         if (!_.mapController.isCompleted) {
        _.mapController.complete(controller);
    }
    
            },
            markers: _.markers,
            polylines: _.polylines,
            initialLocation: _.initialLocation,
            camPos: _.camPos);
      }
     ) ;
  }
}
