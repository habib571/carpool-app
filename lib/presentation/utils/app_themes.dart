import 'package:flutter/material.dart';

import 'app_colors.dart';



class AppThemes {
  AppThemes._();

  //text theme for light theme
  static   const TextTheme _lightTextTheme =  TextTheme(
    displayLarge: TextStyle(fontSize: 20.0, color: AppColors.cTextColor),
    bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.cTextColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.cTextLightColor),
    labelLarge: TextStyle(
        fontSize: 15.0, color: AppColors.cTextColor, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: 16.0, color: AppColors.cTextColor),
    titleMedium: TextStyle(fontSize: 16.0, color: AppColors.cTextColor),
    bodySmall: TextStyle(fontSize: 12.0, color: AppColors.cPrimaryColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: AppColors.cPrimaryBrightness,
    // fontFamily: font1,
    scaffoldBackgroundColor: AppColors.cPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.cPrimaryColor,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.cPrimaryColor,
      iconTheme: IconThemeData(color: AppColors.cTextColor),
      //iconTheme: _lightTextTheme,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.cPrimaryColor,
      // secondary: AppColors.lightSecondaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.cLightBackgroundAlertColor,
        actionTextColor: AppColors.cPrimaryColor),
    iconTheme: const IconThemeData(
      color: AppColors.cCircleColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: AppColors.cPrimaryColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: AppColors.cPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: AppColors.cPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      //prefixStyle: TextStyle(color: AppColors.lightIconColor),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: AppColors.cPrimaryColor,
      //focusColor: AppColors.lightBorderActiveColor,
    ),
  );

//text theme for dark theme
  /*static final TextStyle AppColors.darkScreenHeadingTextStyle =
      AppColors.lightScreenHeadingTextStyle.copyWith(color: AppColors.cPrimaryColor);
  static final TextStyle AppColors.darkScreenTaskNameTextStyle =
      AppColors.lightScreenTaskNameTextStyle.copyWith(color: AppColors.cPrimaryColor);
  static final TextStyle AppColors.darkScreenTaskDurationTextStyle =
      AppColors.lightScreenTaskDurationTextStyle;
  static final TextStyle AppColors.darkScreenButtonTextStyle = TextStyle(
      fontSize: 14.0, color: AppColors.cPrimaryColor, fontWeight: FontWeight.w500);
  static final TextStyle AppColors.darkScreenCaptionTextStyle = TextStyle(
      fontSize: 12.0,
      color: AppColors.darkBackgroundAppBarColor,
      fontWeight: FontWeight.w100);*/

  static const TextTheme _darkTextTheme =  TextTheme(
    displayLarge: TextStyle(fontSize: 20.0, color: AppColors.cPrimaryColor),
    bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.cPrimaryColor),
    bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.cTextLightColor),
    labelLarge: TextStyle(
        fontSize: 15.0, color: AppColors.cPrimaryColor, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: 16.0, color: AppColors.cPrimaryColor),
    titleMedium: TextStyle(fontSize: 16.0, color: AppColors.cPrimaryColor),
    bodySmall: TextStyle(fontSize: 12.0, color: AppColors.cPrimaryColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: AppColors.cPrimaryBrightnessDark, //prefix icon color form input on focus

    // fontFamily: font1,
    scaffoldBackgroundColor: AppColors.cDarkVarientColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.cPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.cAccentColor,
      iconTheme: const IconThemeData(color: AppColors.cPrimaryColor), toolbarTextStyle: _darkTextTheme.bodyMedium, titleTextStyle: _darkTextTheme.titleLarge,
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: AppColors.cLightBackgroundAlertColor,
        actionTextColor: AppColors.cPrimaryColor),
    iconTheme: const IconThemeData(
      color: AppColors.cCircleColor, //AppColors.darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: AppColors.cAccentColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: AppColors.cPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: AppColors.cPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(color: AppColors.cTextLightColor),
      //labelStyle: TextStyle(color: nevada),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cTextLightColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.cErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: AppColors.cPrimaryColor,
      //focusColor: AppColors.darkBorderActiveColor,
    ), colorScheme: const ColorScheme.dark(
      primary: AppColors.cAccentColor,

      // secondary: AppColors.darkSecondaryColor,
    ).copyWith(secondary: AppColors.cAccentColor),
  );
}
