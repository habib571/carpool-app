import 'package:carpooling/presentation/pages/shareridemodule/view/widgets/custom_icon.dart';
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
      required this.accecpted,
      required this.price,
      required this.time});
  final String distance;
  final String from;
  final String to;
  final String date;
  final String waiting;
  final String accecpted;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppUtility().contentHeight(context) * 0.35,
      decoration: BoxDecoration( 
        color:  AppColors.accentColor,
         // border: Border.all(color: AppColors.greyColor, width: 2),
          borderRadius: BorderRadius.circular(8)
          ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
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
              flex: 3,
              child: Row(children: [
                const Image(image: AssetImage('assets/icons/calendar.png')),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$date $time',
                  style: Styles().h2TextStyleRoboto(AppColors.secondaryColor),
                )
              ]),
            ),
            Expanded(flex: 1, child: _showAcceptationSection()),
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$price TND ',
                    style: const TextStyle(
                        color: AppColors.blackcolor,
                        fontSize: 19,
                        fontFamily: 'Popins',
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showKilometerText() {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        '$distance Km' ,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'from',
                  style: Styles().h5TextStyle(
                    AppColors.cTextLightColor,
                  ),
                ),
                Text(
                  from,
                  style: Styles().pTextStyle(
                    AppColors.cBackgroundColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // _showFromAddress(),
          const Divider(
            thickness: 1,
            color: AppColors.cBorderLineColor,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'to',
                  style: Styles().h5TextStyle(
                    AppColors.cTextLightColor,
                  ),
                ),
                Text(
                  to,
                  style: Styles().pTextStyle(
                    AppColors.cBackgroundColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
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
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Accecpted',
              style: Styles().h3TextStyle(AppColors.primaryColor),
            ),
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
            ),
            Text(
              'waiting for',
              style: Styles().h3TextStyle(AppColors.greyColor),
            )
          ],
        ),
      ],
    );
  }
}
