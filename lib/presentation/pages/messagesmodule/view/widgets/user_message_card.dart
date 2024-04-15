import 'package:carpooling/domain/models/message.dart';
import 'package:flutter/material.dart';

import '../../../../../app/date_time_helper.dart';

class UserMessageCard extends StatelessWidget {
  const UserMessageCard({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //message content
        Flexible(
            child: Container(
                padding: const EdgeInsets.all(5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 245, 255),
                    border: Border.all(color: Colors.lightBlue),
                    //making borders curved
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Text(
                  message.msg!,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ))),

        //message time
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            MyDate.getFormattedTime(context: context, time: message.sentTime!),
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
