import 'package:carpooling/presentation/pages/notificationmodule/view/screens/notification_screen.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifIcon extends StatelessWidget {
  const NotifIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Get.to(()=> NotificationsScreen() , 
              transition: Transition.leftToRightWithFade,
                duration: const Duration(milliseconds: 1000) ) ;
       },
      child: Container(
      
        decoration : BoxDecoration( 
           border: Border.all(
            color:  AppColors.accentColor ,
            width: 2
           ),

       shape: BoxShape.circle
        ), 
        child: const Padding(
          padding: EdgeInsets.all(10) ,
          child: Icon(Icons.notifications_none),
          ),
      ),
    ) ;
  }
}