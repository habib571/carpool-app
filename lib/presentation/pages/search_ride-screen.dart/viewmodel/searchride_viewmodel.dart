import 'package:get/get.dart';

class SearchRideController extends GetxController { 
   RxInt passengerNumber = 1.obs ;  
   RxString date = ''.obs; 
    String selectedDate ='' ;

   void increment() { 
     
     if(passengerNumber.value <8) {
         passengerNumber ++ ;
     }
     
   } 
   void decrement() {  
    if(passengerNumber >1) {
        passengerNumber -- ;
     }

   }
}