
import 'package:carpooling/presentation/pages/homemodule/view/widgets/notif_icon.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.title, required this.rFlex, required this.lFlex});
 final String title ; 
  final  int rFlex ; 
  final int  lFlex ; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11,top: 40 ),
      child: Row(       
        children: [ 
         Expanded( 
       flex: lFlex,
        child: const SizedBox()
        ), 
    
          Expanded(
            flex:rFlex,
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