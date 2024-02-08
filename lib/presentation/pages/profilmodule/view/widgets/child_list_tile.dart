
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_colors.dart';


class ChildListTile extends StatelessWidget {
  const ChildListTile({
    Key? key,
    this.title = '',
    this.icon = '',
    this.link = '',
    this.isFav = false,
    this.isSettings = false,
    this.isBorder = true,
    this.activeSwitch = true,
   required this.onClick
  }) : super(key: key);

  final String title;
  final String icon;
  final String link;
  final bool isFav;
  final bool isSettings;
  final bool isBorder;
  final bool activeSwitch;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return 
     InkWell( 
      onTap: () {
        onClick() ;
      },
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical:8.0),
         child: ListTile(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0)
           ),
           contentPadding:const EdgeInsets.symmetric(horizontal: 20.0),
           horizontalTitleGap: 6,
           leading: Padding(
             padding: const EdgeInsets.only(top:3.0),
             child:     Container(  
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.accentColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(icon)
            ),
          )
           ),
           tileColor: AppColors.cPrimaryColor,
           title: Text(
             title,
             style: Styles().mediumTextStyle(
                 AppColors.cTextGreyColor
             ),
           ),
           trailing: SvgPicture.asset('assets/icons/forward.svg'),
          
         ),
       ),
     );
  }
}