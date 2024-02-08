import 'package:carpooling/presentation/pages/maps/mapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
   MapView({super.key,
   required this.markers, 
   required this.polylines , 
   required this.initialLocation,
  required this.camPos , 
  required this.onMapcreated
     });
 final Set<Marker> markers ;
 final Map<PolylineId, Polyline> polylines ; 
 final CameraPosition initialLocation ;  
 final  Function(GoogleMapController controller) onMapcreated;
  CameraPosition? camPos ;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(   
              markers: Set<Marker>.from(markers),
              initialCameraPosition: initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: onMapcreated  ,
              onCameraMove: (CameraPosition position) {
                camPos = position;
              },
              
            );
  }
}