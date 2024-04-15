import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/widgets/chat_card.dart';
import 'package:flutter/material.dart';

class MyconversationsScreen extends StatelessWidget {
  const MyconversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const ApplicationBar(
            isProfile: false,
        title: 'Conversations' 
        
        ) ,
        body: _showBody(),
    ) ;
  } 

  Widget _showBody() { 
     return  ListView.builder(
                  itemCount:  2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25.0),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return  const ChatUserCard() ;
                  }) ;
  }
}