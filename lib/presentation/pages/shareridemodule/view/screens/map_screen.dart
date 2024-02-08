/*

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ,
    )
  } 
  Widget showbody() { 
     
  } 
  Widget _showMap() { 
    
      return GoogleMap(   
              markers: Set<Marker>.from(markers),
              initialCameraPosition: initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onCameraMove: (CameraPosition position) {
                camPos = position;
              },
              onCameraIdle: () async {
              /*  try {
                  List<Placemark> p = await placemarkFromCoordinates(
                      camPos!.target.latitude, camPos!.target.longitude);

                  Placemark place = p[0];

                  setState(() {
                    _currentAddress =
                        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
                    startAddressController.text = _currentAddress;
                    _startAddress = _currentAddress;
                  });
                } catch (e) {
                  print(e);
                }*/
              },
            ),
  }
} */