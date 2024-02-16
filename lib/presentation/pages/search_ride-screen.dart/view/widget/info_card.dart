// ignore_for_file: file_names

import 'package:carpooling/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.assetName,
      required this.ontap,
      required this.infoTxt,
      required this.date});
  final String assetName;
  final Function ontap;
  final String infoTxt;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        height: AppUtility().contentHeight(context) * 0.15,
        decoration: BoxDecoration(
            boxShadow: const [],
            color: AppColors.accentColor,

            //border: Border.all(color: AppColors.greyColor, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(assetName),
              Text(infoTxt, style: Styles().pTextStyle(AppColors.blackcolor)),
              const SizedBox(
                height: 10,
              ),
              Text(
                date,
                style: const TextStyle(
                  color: AppColors.cTextColor,
                  fontFamily: AppFonts.robotoRegular,
                  fontSize: AppDimens.h3Size,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
