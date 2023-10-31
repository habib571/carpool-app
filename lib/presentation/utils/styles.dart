
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_fonts.dart';


class Styles{
  Styles();

  TextStyle titleStyle() {
    return const TextStyle(
        fontSize: AppDimens.smallTextSize,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        letterSpacing: AppDimens.largeSpace,
        color: AppColors.cAccentColor,
        fontFamily: AppFonts.poppinsMedium
    );
  }

  TextStyle smallTextStyle() {
    return const TextStyle(
        color: AppColors.cTextBrownColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: AppDimens.smallTextSize,
        fontFamily: AppFonts.robotoRegular
    );
  }

  TextStyle headingStyle() {
    return const TextStyle(
        color: AppColors.cTextColor,
        fontSize: AppDimens.subHeadingSize,
        fontFamily: AppFonts.poppinsSemiBold,
        fontWeight: FontWeight.w400,
    );
  } 

    TextStyle popUpTextStyle() {
    return const TextStyle(
        color: AppColors.cTextColor,
        fontSize: AppDimens.subHeadingSize,
        fontFamily: AppFonts.poppinsRegular,
        fontWeight: FontWeight.w500,
    );
  }
 
  TextStyle mediumTextStyle(Color color) {
    return TextStyle(
        color: color,
        fontSize: AppDimens.mediumTextSize,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w400,
        letterSpacing: AppDimens.letterSpace
    );
  }

  TextStyle subHeaderStyle(Color color,double fontSize,String fontFamily) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        letterSpacing: AppDimens.letterSpace,
        overflow: TextOverflow.ellipsis,
        height: 1
    );
  }

  TextStyle titleHeadingStyle(){
    return const TextStyle(
      color: AppColors.cPrimaryColor,
      fontSize: AppDimens.largeSize,
      fontFamily: AppFonts.poppinsRegular,
      fontWeight: FontWeight.w400,
      letterSpacing: AppDimens.letterSpace
    );
  }

  TextStyle descriptionStyle(){
    return const TextStyle(
      color: AppColors.cTextLightColor,
      fontSize: AppDimens.smallTextSize,
      fontFamily: AppFonts.robotoRegular,
      fontWeight: FontWeight.w400,
      letterSpacing: AppDimens.letterSpace
    );
  }

  TextStyle textSmallStyle(){
    return const TextStyle(
      color: AppColors.cTextBrownColor,
      fontSize: AppDimens.mediumTextSize,
      fontFamily: AppFonts.robotoRegular,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle textSmallStyleLight(){
    return const TextStyle(
        color: AppColors.cPrimaryColor,
        fontSize: AppDimens.mediumTextSize,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle pageHeading(){
    return const TextStyle(
        color: AppColors.cAccentDarkColor,
        fontSize: AppDimens.pageTitleSize,
        fontFamily: AppFonts.poppinsRegular
    );
  }

  TextStyle ratingStyle(){
    return const TextStyle(
        color: AppColors.cSecondaryColor,
        fontSize: AppDimens.smallTextSize,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w400,
        letterSpacing: AppDimens.letterSpace
    );
  }

  TextStyle priceStyle() {
    return const TextStyle(
      color: AppColors.cInfoColor,
      fontSize: AppDimens.minTextSize,
      fontFamily: AppFonts.robotoRegular,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle codeStyle() {
    return const TextStyle(
      color: AppColors.cAccentColor,
      fontSize: AppDimens.largeSize,
      fontFamily: AppFonts.robotoMedium,
      letterSpacing: AppDimens.largeSpace
    );
  }

  TextStyle chatTextStyle(Color color) {
    return TextStyle(
        color: color,
        fontSize: AppDimens.h2Size,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w700
    );
  }


//-- Theme Text Style --//

  TextStyle h1TextStyle(Color color){
      return TextStyle(
        color: color,
        fontFamily: AppFonts.poppinsMedium,
        fontSize: AppDimens.h1Size,
        fontWeight: FontWeight.w400,
      );
  }

  TextStyle h1TitleStyle(Color color){
    return  TextStyle(
      color :color,
      fontFamily: AppFonts.poppinsRegular,
      fontSize: AppDimens.h1Size,
      fontWeight: FontWeight.w500,
      letterSpacing: AppDimens.letterSpace
    );
  }

  TextStyle h2TextStyle(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoMedium,
      fontSize: AppDimens.h2Size,
      fontWeight: FontWeight.w700,
    );
  }
  TextStyle h2TextStyleRoboto(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.h2Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle h3TextStyle(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.h3Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle h4TextStyle(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.h4Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle h5TextStyle(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.h5Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle h6TextStyle(Color color){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoMedium,
      fontSize: AppDimens.pSize,
      letterSpacing: AppDimens.mediumSpace
    );
  }

  TextStyle pTextStyle(Color color,){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.pSize,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle pTextStyleWithH(Color color, double height){
    return TextStyle(
      color: color,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.pSize,
      fontWeight: FontWeight.w400,
      height: height
    );
  }

}