import 'package:carpooling/domain/models/chat_user.dart';
import 'package:carpooling/domain/models/message.dart';
import 'package:carpooling/domain/models/ride.dart';
import 'package:carpooling/presentation/pages/messagesmodule/viewmodel/conversations_view_model.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
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

  Ride? rideDriver;
  ChatUser? chatUser;

  getDriverInfo() {
    if (Get.find<SearchRideController>().initialized) {
      rideDriver = Get.find<SearchRideController>().ride;
    } else {
      chatUser = Get.find<ConversationsController>().chatUser;
    }
  }

  final driver = Get.find<SearchRideController>().ride;
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

    Message message = Message(
        driver.driverId?? chatUser!.toId, currentUserId, messageInput.text, time, false);
    firestore.collection('messages').add(message.toJson());
    update();
  }

  sendFirstMessage() {
    _getCurrentUserId();
    ChatUser chatUser = ChatUser(
        '${driver.driverId}_$currentUserId',
        currentUserId,
        driver.driverId,
        driver.name,
        driver.driverPicture,
        '',
        true);

    firestore
        .collection('chatUsers')
        .add(chatUser.toJson())
        .then((value) => sendMessage());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    _getCurrentUserId();

    return firestore
        .collection('messages')
        .where('id', isEqualTo: '${driver.driverId ?? chatUser!.toId}_$currentUserId')
        .snapshots();
  }
}
