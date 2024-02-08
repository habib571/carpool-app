import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
// ignore: must_be_immutable
class AutoComplet extends StatelessWidget {
   AutoComplet({super.key});
TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        leading: IconButton(onPressed: (){
           Navigator.of(context).pop();
        }, icon: const Icon(Icons.backpack_sharp) 
        ) , 
        title: const Text('test'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            placesAutoCompleteTextField(),
          ],
        ),
      ),
    );
  }

  placesAutoCompleteTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GooglePlaceAutoCompleteTextField( 
            textEditingController: controller,
            googleAPIKey: "AIzaSyAmLpS4M-oVzBlbyo90OZp_3QR3_fJbDMQ",
            
            debounceTime: 400,
            countries: const ["tn", "fr"],
            isLatLngRequired: false,
            getPlaceDetailWithLatLng: (Prediction prediction) { 
              if (kDebugMode) {
                print("placeDetails${prediction.lat}");
              }
            },

            itemClick: (Prediction prediction) {
              controller.text = prediction.description ?? "";
              controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
            },
            seperatedBuilder: const Divider(),
            // OPTIONAL// If you want to customize list view item builder
            itemBuilder: (context, index, Prediction prediction) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(child: Text(prediction.description??""))
                  ],
                ),
              );
            },

            isCrossBtnShown: true,

            // default 600 ms ,
          ), 
          SizedBox(height: 20,)  ,
          GooglePlaceAutoCompleteTextField( 
            
            textEditingController: controller2,
            googleAPIKey: "AIzaSyAmLpS4M-oVzBlbyo90OZp_3QR3_fJbDMQ",
            
            debounceTime: 400,
            countries: const ["tn", "fr"],
            isLatLngRequired: false,
            getPlaceDetailWithLatLng: (Prediction prediction) { 
              if (kDebugMode) {
                print("placeDetails${prediction.lat}");
              }
            }, 
            inputDecoration: const InputDecoration(),

            itemClick: (Prediction prediction) {
              controller.text = prediction.description ?? "";
              controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
            },
            seperatedBuilder: const Divider(),
            // OPTIONAL// If you want to customize list view item builder
            itemBuilder: (context, index, Prediction prediction) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(child: Text(prediction.description??""))
                  ],
                ),
              );
            },

            isCrossBtnShown: true,

            // default 600 ms ,
          ),
        ],
      ),
    );
  }
}