import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimens.dart';


class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({Key? key, 
    // Key key,
    required this.title,
    this.titleSize = 17,
    this.color = AppColors.cTextMediumColor,
    this.elevation = 0.0,
    this.actions = const <Widget>[],
    this.leading = const SizedBox(
      height: 0,
    ),
    this.isLeading = true,
    this.backgroundColor = AppColors.cPrimaryColor,
    this.flexible = const SizedBox(
      height: 0,
    ),
    this.fontWeight = FontWeight.normal,
    this.titleFamily = 'RobotoRegular',
    this.isProfile = true,
    this.centerTitle = true,
    this.profile = const SizedBox(
      height: 0,
    ),
  }) : super(key: key)
  // : super(key: key)
  ;

  final String title;
  final double titleSize;
  final double elevation;
  final Color color;
  final List<Widget> actions;
  final Widget leading;
  final bool isLeading;
  final Color backgroundColor;
  final Widget flexible;
  final FontWeight fontWeight;
  final String titleFamily;
  final bool isProfile;
  final bool centerTitle;
  final Widget profile;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return actions.isEmpty
        ? AppBar(
            iconTheme: const IconThemeData(
              color: AppColors.cTextColor,
            ),
            centerTitle: centerTitle,
            title: isProfile
                ? profile
                : Text(
                    title,
                    style: TextStyle(
                        fontFamily: titleFamily,
                        fontSize: titleSize,
                        letterSpacing: AppDimens.smallSpace,
                        color: color,
                        fontWeight: fontWeight),
                  ),
            backgroundColor: backgroundColor,
            leading: isLeading ? leading : const SizedBox(),
            elevation: elevation,
            flexibleSpace: flexible,
            //  bottom: bottom,
          )
        : AppBar(
            iconTheme: const IconThemeData(
              color: AppColors.cTextColor,
            ),
            centerTitle: centerTitle,
            title: isProfile
                ? profile
                : Text(
                    title,
                    style: TextStyle(
                        fontFamily: titleFamily,
                        fontSize: titleSize,
                        letterSpacing: AppDimens.smallSpace,
                        color: color,
                        fontWeight: fontWeight),
                  ),
            backgroundColor: backgroundColor,
            leading: isLeading ? leading : const SizedBox(),
            actions: actions,
            elevation: elevation,
            flexibleSpace: flexible,
            //  bottom: bottom,
          );
  }
}
