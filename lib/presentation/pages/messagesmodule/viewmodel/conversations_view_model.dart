import 'package:carpooling/domain/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app/app_prefs.dart';

class ConversationsController extends GetxController {
  @override
  void onInit() {
    getUsersConversations();
    super.onInit();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String currentUserId = '';
  List<ChatUser> list = [];
  ChatUser? _chatUser;
  ChatUser? get chatUser => _chatUser;
  void setChatUser(ChatUser chatUser) {
    _chatUser = _chatUser;
  }

  _getCurrentUserId() async {
    currentUserId = (await Apppreference.getUserId())!;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersConversations() {
    _getCurrentUserId();
    return firestore
        .collection('chatUsers')
        .where('fromId', isEqualTo: currentUserId)
        .snapshots();
  }
}
