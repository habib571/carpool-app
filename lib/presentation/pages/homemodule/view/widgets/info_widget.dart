// ignore: file_names
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row( 
        children: [
          Container(  
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.accentColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(imageUrl),
              ),
            ),
          ), 
        const SizedBox(width: 5),
          Text(
            title,
            style: Styles().subHeaderStyle(AppColors.blackcolor,
                AppDimens.minSmallTextSize, AppFonts.robotoRegular),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
