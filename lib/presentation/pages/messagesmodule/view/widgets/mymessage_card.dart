import 'package:carpooling/domain/models/message.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';


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
           SizedBox(width: AppUtility().contentWidth(context) *0.12),

          //double tick blue icon for message read
          if (message.isRead!)
            const Icon(Icons.done_all_rounded, color: Colors.blue, size: 20),

          //for adding some space
          const SizedBox(width: 2),

          //sent time
          Text(
             message.sentTime! ,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),

      //message content
      Flexible(
        child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                //border: Border.all(color: themecolor),
                //making borders curved
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child:

                //show text
                Text(message.msg!,
                    style: Styles().h3TextStyle(AppColors.blackcolor))),
      ),
    ]);
  }
}
