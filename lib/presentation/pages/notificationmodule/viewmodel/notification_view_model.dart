import 'package:carpooling/domain/usecases/auth_usecase.dart/accept_passenger_user_case.dart';
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

  final AcceptPassengerUserCase _acceptPassengerUserCase;
  NotificationController(this._acceptPassengerUserCase);
  List<Notifi> list = [];
  RxBool isButtonLoading = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userId = '';
  _getUserId() async {
    userId = (await Apppreference.getUserId())!;
    print('uuuuuuuuuuuuuuuuuuu $userId');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotifications() {
    _getUserId();
    return firestore
        .collection('notifications')
        .where('toId', isEqualTo: "382eec41-c90e-47c3-86ae-909914b4ebe2")
        .snapshots();

  }

  acceptPassenger(int rideId, String passengerId, String driverId) async {
    isButtonLoading.value = true;
    (await _acceptPassengerUserCase.acceptPassenger(rideId, passengerId))
        .fold((failure) {
          isButtonLoading.value = false ;
          //_deleteNotifcation(passengerId, driverId) ;

        } , (data) {
      _deleteNotifcation(passengerId, driverId);
      isButtonLoading.value = false;
    });
  }

  _deleteNotifcation(String fromId, String toId) async {
    final query = await firestore
        .collection('notifications')
        .where('fromId', isEqualTo: fromId)
        .where('toId', isEqualTo: toId)
        .get();
    final batch = FirebaseFirestore.instance.batch();
    for (final docSnapshot in query.docs) {
      batch.delete(docSnapshot.reference);
    }
    await batch.commit(); 
    update() ;
  }
}
