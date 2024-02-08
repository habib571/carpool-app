import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_fonts.dart';

class RideSharerbutton extends StatelessWidget {
  const RideSharerbutton({
    super.key ,
     this.iconColor=  AppColors.primaryColor,
    this.borderColor =  AppColors.primaryColor,
    this.buttonColor = AppColors.primaryColor,
    required this.onPressed,
    this.text = '',
    this.btnTxtStyle =  const TextStyle(
        color: AppColors.primaryColor,
        fontSize: AppDimens.h2Size,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w400,
        letterSpacing: AppDimens.letterSpace
    )
    }); 
  final Color iconColor ;
  final Color buttonColor;
  final Color borderColor ;
  final String text;
  final TextStyle btnTxtStyle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: MaterialButton( 
            color: buttonColor,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor ),
                borderRadius: BorderRadius.circular(12)
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                
                Text(
                  text,
                  style: btnTxtStyle,
                  textAlign: TextAlign.center,
                ), 
                 Image(
                  image:const  AssetImage('assets/icons/white_seat.png') ,
                  color: iconColor,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}