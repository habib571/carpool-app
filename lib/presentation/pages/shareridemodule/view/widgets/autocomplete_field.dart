import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AutoCompleteField extends StatelessWidget {
  const AutoCompleteField({super.key, required this.controller});

   final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return    GooglePlaceAutoCompleteTextField( 
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
          ) ;
  }
}