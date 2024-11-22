import 'package:carpooling/presentation/pages/messagesmodule/view/widgets/chat_input.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/widgets/mymessage_card.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/widgets/user_message_card.dart';
import 'package:carpooling/presentation/pages/messagesmodule/viewmodel/chat_view_model.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/message.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final MessagesController _controller = Get.put(MessagesController());
  List<Message> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 248, 255),
      /*appBar:AppBar(
          backgroundColor: themecolor,
          automaticallyImplyLeading: false,
          flexibleSpace: ChatAppBar(room: room)),*/
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<MessagesController>(
                init: MessagesController(),
                builder: (ctrl) {
                  return StreamBuilder(
                    stream: ctrl.getMessages(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
                        return const Center(child: Text('No messages yet.'));
                      }

                      final data = snapshot.data?.docs;
                          _list = data
                                  ?.map((e) => Message.fromJson(e.data()))
                                  .toList() ??
                              [];

                          return ListView.builder(
                              reverse: true,
                              itemCount: _list.length,
                              padding: EdgeInsets.only(
                                  top: AppUtility().contentHeight(context) *
                                      .01),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return _list[index].fromId ==
                                        ctrl.currentUserId
                                    ? MyMessageCard(message: _list[index])
                                    : UserMessageCard(
                                        message: _list[index]);
                              });
                      }

                  );
                }),
          ),
          ChatInput(
              messageInput: _controller.messageInput,
              sendMessage: () {
                _list.isEmpty
                    ? _controller.sendFirstMessage()
                    : _controller.sendMessage();
              }),

          //show emojis on keyboard emoji button click & vice versa
        ],
      ),
    );
  }
}
