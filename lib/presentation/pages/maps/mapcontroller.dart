/*

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController { 
   final CameraPosition initialLocation =
    const CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController; 
  
  late Rx<Position> currentPosition;
  RxString currentAddress = ''.obs; 


    getCurrentLocation() async {
    await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      
        currentPosition.value = position; 
        print('CURRENT POS: $currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      
      await _getAddress();
    }).catchError((e) {
      print("errorrrr");
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition.value.latitude, currentPosition.value.longitude);

      Placemark place = p[0];

      
        currentAddress.value =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      
    } catch (e) {
      print(e);
    }
  }


}*/