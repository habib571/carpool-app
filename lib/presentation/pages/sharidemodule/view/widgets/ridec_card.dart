import 'package:carpooling/presentation/pages/sharidemodule/view/widgets/custom_icon.dart';
import 'package:carpooling/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../component/dotted_line.dart';

class RideCard extends StatelessWidget {
  const RideCard(
      {super.key,
      required this.distance,
      required this.from,
      required this.to,
      required this.date,
      required this.waiting,
      required this.accecpted});
  final String distance;
  final String from;
  final String to;
  final String date;
  final String waiting;
  final String accecpted;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height:AppUtility().contentHeight(context),

      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _showKilometerText(),
                  const DottedLine(),
                  _showLocation(),
                ],
              ),
            ),
            Expanded(
              child: Row(children: [
                const Image(image: AssetImage('assets/icons/calendar.png')),
                Text(
                  date,
                  style: Styles().h2TextStyleRoboto(AppColors.secondaryColor),
                )
              ]),
            ),
            Expanded(child: _showAcceptationSection())
          ],
        ),
      ),
    );
  }

  Widget _showKilometerText() {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        distance,
        style: Styles().subHeaderStyle(AppColors.cTextGreyColor,
            AppDimens.minSmallTextSize, AppFonts.robotoRegular),
      ),
    );
  }

  Widget _showLocation() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            from,
            style: Styles().h5TextStyle(
              AppColors.cTextLightColor,
            ),
          ),
          Text(
            AppStrings.locationAddress,
            style: Styles().pTextStyle(
              AppColors.cBackgroundColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // _showFromAddress(),
          const Divider(
            thickness: 1,
            color: AppColors.cBorderLineColor,
          ),
          Text(
            to,
            style: Styles().h5TextStyle(
              AppColors.cTextLightColor,
            ),
          ),
          Text(
            AppStrings.locationAddress,
            style: Styles().pTextStyle(
              AppColors.cBackgroundColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // _showToAddress(),
        ],
      ),
    );
  }

  Widget _showAcceptationSection() {
    return Row(
      children: [
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/person_blue.png')),
            Text(
              accecpted,
              style: Styles().h3TextStyle(AppColors.primaryColor),
            )
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/person.png')),
            Text(
              waiting,
              style: Styles().h3TextStyle(AppColors.greyColor),
            )
          ],
        ),
        const CustomIcon(imageurl: 'assets/icons/delete.png'),
      ],
    );
  }
}
