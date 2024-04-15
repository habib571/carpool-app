import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app/app_prefs.dart';
import '../../../../domain/models/notification.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

 List<Notifi>  list = [];
 
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userId = '';
  getUserId() async {
    userId = (await Apppreference.getUserId())!; 
    print('uuuuuuuuuuuuuuuuuuu $userId') ;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotifications() {
    return firestore
        .collection('notifications')
        .where('fromId', isEqualTo: 'c236bdcd-8eff-4811-aa02-25c8ed07eb46')
        .snapshots();
  }
}
