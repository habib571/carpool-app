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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        switch (snapshot.connectionState) {
                          //if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const SizedBox();

                          //if some or all data is loaded then show it
                          case ConnectionState.active:
                          case ConnectionState.done:
                            final data = snapshot.data?.docs;
                            ctrl.list = data
                                    ?.map((e) => Message.fromJson(e.data()))
                                    .toList() ??
                                [];

                            return ListView.builder(
                                reverse: true,
                                itemCount: ctrl.list.length,
                                padding: EdgeInsets.only(top: AppUtility().contentHeight(context) * .01),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ctrl.list[index].fromId ==
                                          ctrl.currentUserId
                                      ? MyMessageCard(message: ctrl.list[index])
                                      : UserMessageCard(
                                          message: ctrl.list[index]);
                                });
                        }
                      },
                    );
                  }),
            ),
            ChatInput(
              messageInput: _controller.messageInput,
              sendMessage: () {
                 _controller.list.isEmpty 
                 ? _controller.sendFirstMessage() 
                  : _controller.sendMessage() ;
              } 
            ),

            //show emojis on keyboard emoji button click & vice versa
          ],
        ),
      ),
    );
  }
}
