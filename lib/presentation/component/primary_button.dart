import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimens.dart';
import '../utils/app_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key,  
    this.borderColor =  AppColors.primaryColor,
    this.buttonColor = AppColors.primaryColor, 
    this.widget =  const SizedBox(),
    required this.onPressed,
    this.text = '',
    this.btnTxtStyle =  const TextStyle(
        color: AppColors.cPrimaryColor,
        fontSize: AppDimens.h2Size,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w400,
        letterSpacing: AppDimens.letterSpace
    ), 
  });

  final Color buttonColor;
  final Color borderColor ;
  final String text;
  final TextStyle btnTxtStyle;
  final Function() onPressed; 
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                widget ,
               
                Text(
                  text,
                  style: btnTxtStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ), 
       
      ],
    );
  }
}
