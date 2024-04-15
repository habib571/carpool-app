import 'package:carpooling/domain/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_prefs.dart';

class MessagesController extends GetxController { 
  @override
  void onInit() {
    super.onInit();
     gelMessages() ;
  }
  final userId = Get.arguments;
  final TextEditingController messageInput = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String currentUserId = ''; 
  List<Message> list = [] ;
  _getCurrentUserId() async {
    currentUserId = (await Apppreference.getUserId())!;
  }

  sendMessage() async {
    _getCurrentUserId();
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    Message message =
        Message(userId, currentUserId, messageInput.text, time, false);
    firestore.collection('messages').add(message.toJson()); 
    update() ;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> gelMessages() {
    _getCurrentUserId();

    return firestore
        .collection('messages')
        .where('fromId', isEqualTo: currentUserId)
        .where('toId', isEqualTo: userId)
        .snapshots();
  }
}
