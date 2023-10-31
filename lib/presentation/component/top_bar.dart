
import 'package:carpooling/presentation/pages/homemodule/view/widgets/notif_icon.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.title});
 final String title ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11 ,top: 35),
      child: Row(       
        children: [ 
      const   Expanded( 
      flex: 3,
        child: SizedBox()
        ), 
    
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                   title,
                  style: Styles().h1TitleStyle(AppColors.primaryColor),
                ),
                const NotifIcon(),
              ],
            ),
          )
        ],
      ),
    );
  }
}