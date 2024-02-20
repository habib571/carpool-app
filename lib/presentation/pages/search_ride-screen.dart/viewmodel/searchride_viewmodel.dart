import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../../../common/state_render_imp.dart';
import '../../../utils/app_colors.dart';

class SearchRideController extends GetxController {
  @override
  void onInit() {
    start();
      departController.addListener(() {
      onStartAdressChanged();
    });
    arriveController.addListener(() {
      onDestinationAdressChanged();
    });
    super.onInit();
  }

  void start() {
    _stateStream = stateController.stream.asBroadcastStream();
    stateController.add(ContentState()); 
  
  }

  // google maps suggestions api variables 
   final uuid = const Uuid();
  RxString sessionToken = ''.obs;
  
  // ride info variables 
  RxInt passengerNumber = 1.obs;
  RxString date = ''.obs;
  String selectedDate = '';

 GlobalKey<FormState> locationformKey = GlobalKey<FormState>();

  DraggableScrollableController scrollableController =
      DraggableScrollableController();
  // state render declaration 
  late Stream<FlowState> _stateStream;
  final stateController = StreamController<FlowState>();
  Stream<FlowState> get outputState =>
      _stateStream.map((flowState) => flowState); 

 // google maps  variable declaration 
  CameraPosition? camPos;
  final CameraPosition initialLocation =
      const CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;
  RxSet<Marker> markers = <Marker>{}.obs;
  late Position currentPosition;
   RxList placeList = [].obs;
  List<LatLng> polylineCoordinates = [];
  RxDouble placeDistance = 0.0.obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  late PolylinePoints polylinePoints;
  RxString currentAddress = ''.obs;
  RxString startaddress = ''.obs;
  RxString destinationAddress = ''.obs; 
  final departController = TextEditingController();
  TextEditingController arriveController = TextEditingController();
   FocusNode arriveFocusNode = FocusNode();
  FocusNode startFocusNode = FocusNode();
  RxBool disablePrediction = true.obs;

  void incrementPassneger() {
    if (passengerNumber.value < 8) {
      passengerNumber++;
    }
  }

  void decrementPassenger() {
    if (passengerNumber > 1) {
      passengerNumber--;
    }
  }
  getCurrentLocation() async {
    await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      currentPosition = position;
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
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = p[0];
      currentAddress.value =
          "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      //  departController.text = currentAddress.value;
      startaddress.value = currentAddress.value;
    } catch (e) {
      print(e);
    }
  } 
  onStartAdressChanged() {
    sessionToken.value = uuid.v4();
    getSuggestion(departController.text);
  }

  onDestinationAdressChanged() {
    sessionToken.value = uuid.v4();
    getSuggestion(arriveController.text);
  }

  void getSuggestion(String input) async {
    String kplacesApiKey = "AIzaSyAmLpS4M-oVzBlbyo90OZp_3QR3_fJbDMQ";
    String components = 'country:tn';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kplacesApiKey&components=$components&sessiontoken=${sessionToken.value}';
    var response = await http.get(
      Uri.parse(request),
    );
    if (response.statusCode == 200) { 
       print( ' predictions : _____________________${response.body}') ;
      placeList.value = json.decode(response.body)['predictions'];
    } else {
      throw Exception('Failed to load predictions');
    }
  }
  
  calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location>? startPlacemark =
          await locationFromAddress(startaddress.value);
      List<Location>? destinationPlacemark =
          await locationFromAddress(destinationAddress.value);

      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      double startLatitude = startaddress.value == currentAddress.value
          ? currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = startaddress.value == currentAddress.value
          ? currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: startaddress.value,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: destinationAddress.value,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        placeDistance.value += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      print('DISTANCE: ${placeDistance.value} km');

      update();
    } catch (e) {
      print(e);
    }
  }

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAmLpS4M-oVzBlbyo90OZp_3QR3_fJbDMQ', // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.secondaryColor,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

 
}
