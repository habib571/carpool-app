import 'package:carpooling/domain/models/chat_user.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/screens/chat_screen.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/widgets/chat_card.dart';
import 'package:carpooling/presentation/pages/messagesmodule/viewmodel/conversations_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyconversationsScreen extends StatelessWidget {
  MyconversationsScreen({super.key});
  final ConversationsController _controller =
      Get.put(ConversationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(isProfile: false, title: 'Conversations'),
      body: _showBody(),
    );
  }

  Widget _showBody() {
    return StreamBuilder(
      stream: _controller.getUsersConversations(),
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
            _controller.list =
                data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

            return ListView.builder(
                itemCount: _controller.list.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 25.0),
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ChatUserCard( 
                    ontap: () {
                        Get.to(()=> ChatScreen() , arguments: _controller.list[index] ) ;
                    },
                    chatuser: _controller.list[index],
                  );
                });
        }
      },
    );
    
  }
}


