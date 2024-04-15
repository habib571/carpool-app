import 'package:carpooling/domain/models/message.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../app/date_time_helper.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //message time
      Row(
        children: [
          //for adding some space
          const SizedBox(width: 100),

          //double tick blue icon for message read
          if (message.isRead!)
            const Icon(Icons.done_all_rounded, color: Colors.blue, size: 20),

          //for adding some space
          const SizedBox(width: 2),

          //sent time
          Text(
            MyDate.getFormattedTime(context: context, time: message.sentTime!),
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),

      //message content
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 30,),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              //border: Border.all(color: themecolor),
              //making borders curved
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child:

              //show text
              Text(message.msg!,
                  style: Styles().chatTextStyle(AppColors.textPrimaryColor)),
        ),
      ),
    ]);
  }
}
