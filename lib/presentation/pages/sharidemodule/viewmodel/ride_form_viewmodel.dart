import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RideFormController extends GetxController { 
final dateController = TextEditingController() ; 
final timeController =TextEditingController();  
final  departController = TextEditingController() ;
final   arriveController = TextEditingController() ;
FocusNode dateFocusNode = FocusNode() ;
FocusNode timeFocusNode = FocusNode() ; 
RxList<int> itemlist = [1,2,3,4].obs ; 
RxInt dropValue = 1.obs ;
}