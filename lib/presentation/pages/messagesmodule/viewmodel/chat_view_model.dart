import 'package:carpooling/domain/models/chat_user.dart';
import 'package:carpooling/domain/models/message.dart';
import 'package:carpooling/domain/models/ride.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_prefs.dart';

class MessagesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getMessages();
  }

   Ride driver = Get.arguments; 
  final TextEditingController messageInput = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String currentUserId = '';
  List<Message> list = [];
  _getCurrentUserId() async {
    currentUserId = (await Apppreference.getUserId())!;
  }

  /*String getConversationID(String id) {
    _getCurrentUserId();
    return currentUserId.hashCode <= id.hashCode
        ? '${currentUserId}_$id'
        : '${id}_$currentUserId';
  }*/

  sendMessage() async {
    _getCurrentUserId();
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    Message message = Message('${driver.driverId}_$currentUserId', driver.driverId,
        currentUserId, messageInput.text, time, false);
    firestore.collection('messages').add(message.toJson());
    update();
  }

  sendFirstMessage() {
    _getCurrentUserId();
    ChatUser chatUser = ChatUser( '${driver.driverId}_$currentUserId',   currentUserId, driver.driverId,
        driver.name , driver.driverPicture , '' , true );

    firestore.collection('chatUsers').add(chatUser.toJson()).then((value) => sendMessage()) ;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    _getCurrentUserId();

    return firestore
        .collection('messages')
        .where('id', isEqualTo: '${driver.driverId}_$currentUserId')
        .snapshots();
  }
}
