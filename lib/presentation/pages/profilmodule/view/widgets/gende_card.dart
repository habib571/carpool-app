import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    this.bordercolor = AppColors.greyColor,
    this.iconColor = AppColors.greyColor,
    this.txtColor = AppColors.greyColor,
    required this.iconPath,
    required this.gender, 
    required this.ontap,
  });
  final Color bordercolor;
  final Color iconColor;
  final Color txtColor;
  final String iconPath;
  final String gender; 
  final Function ontap ;
  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: () { 
        ontap() ;
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: bordercolor),
              borderRadius: BorderRadius.circular(5),
              color: AppColors.cScaffoldColor),
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(iconPath),
                    color: iconColor,
                  ),
                  Text(
                    gender,
                    style: Styles().h2TextStyle(txtColor),
                  )
                ],
              ))),
    );
  }
}
