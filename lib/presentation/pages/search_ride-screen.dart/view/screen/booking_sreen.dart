import 'package:carpooling/presentation/component/dotted_line.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/passengers_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/date_screen.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_strings.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    ) ;
  } 
  Widget _showBookingOverlay(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(ctx).size.height * .4,
              color: Colors.transparent,
            ),
         
          ],
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: AppUtility().contentHeight(ctx) * .05,
                  color: Colors.transparent,
                ),
                Container(
                  height: AppUtility().contentHeight(ctx) * .45,
                  decoration: const BoxDecoration( 
                    image: DecorationImage(
                      image:   AssetImage('assets/images/car_image.png') ,
                        fit: BoxFit.cover
                      ) ,
                    color: AppColors.cAccentDarkColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                    ),
                  ),
                 
                ),
              ],
            ),
            _showBookingDetails(),
          ],
        )
      ],
    );
  }

  Widget _showLocationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cPrimaryColor,
          borderRadius: BorderRadius.circular(10.0)),
      height: AppUtility().contentHeight(context) * .16,
      margin: const EdgeInsets.only(top: 10.0, left: 50, right: 50),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _showKilometerText(),
          const DottedLine(),
          _showLocation(),
        ],
      ),
    );
  }

  Widget _showKilometerText() {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        AppStrings.kilometerText,
        style: Styles().subHeaderStyle(AppColors.cTextGreyColor,
            AppDimens.minSmallTextSize, AppFonts.robotoRegular),
      ),
    );
  }

  Widget _showLocation() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'home.leaveFrom',
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
            'home.goTo',
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

  Widget _showBookingDetails() {
    return Column(
      children: [
        _bookingOption(),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: _showBtnSection(),
        ),
        // _useCode()
      ],
    );
  }

  Widget _bookingOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap :() {
            Get.to(()=> SelectDateScreen()) ;
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.cPrimaryColor,
                borderRadius: BorderRadius.circular(12.0)),
            margin:const EdgeInsets.all(5.0),
            padding:const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset('assets/icons/red_calendar.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Mer 13',
                    style: Styles().h5TextStyle(AppColors.cBackgroundColor),
                  ),
                ),
                Text(
                  '17:00',
                  style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                ),
              ],
            ),
          ),
        
        ),
        InkWell(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.cPrimaryColor,
                borderRadius: BorderRadius.circular(12.0)),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
             Image.asset('assets/icons/user.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'passenger',
                    style: Styles().h5TextStyle(AppColors.cBackgroundColor),
                  ),
                ),
                Text(
                  '1',
                  style: Styles().h4TextStyle(AppColors.cBackgroundColor),
                ),
              ],
            ),
          ),
          onTap: () {
            Get.to(()=>PassengerScreen()) ;
          },
        ),
      ],
    );
  }

  Widget _showBtnSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: PrimaryButton(
        text: 'Find',
        onPressed: () {
          
        },
      ),
    );
  }


}