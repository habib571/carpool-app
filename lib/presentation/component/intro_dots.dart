import 'package:flutter/material.dart';


import '../utils/app_colors.dart';
import '../utils/app_dimens.dart';
import '../utils/app_fonts.dart';
import '../utils/app_utility.dart';
import '../utils/styles.dart';

class IntroDots extends StatelessWidget {
  const IntroDots({Key? key, 
    required this.image,
    this.bgColor = AppColors.cInfoColor,
    this.headingColor = AppColors.cTextBrownColor,
    this.title = '',
    this.content = '',
  }) : super(key: key);

  final Widget image;
  final Color bgColor;
  final Color headingColor;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppUtility().contentHeight(context) *.53,
            width: AppUtility().contentWidth(context),
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0,bottom: 20),
            child: Center(
              child: Text(
                title,
                style: Styles().subHeaderStyle(
                  headingColor,
                  AppDimens.subHeadingSize,
                  AppFonts.poppinsSemiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Text(
              content,
              style: Styles().subHeaderStyle(
                  headingColor,
                  AppDimens.smallTextSize,
                  AppFonts.robotoRegular
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
