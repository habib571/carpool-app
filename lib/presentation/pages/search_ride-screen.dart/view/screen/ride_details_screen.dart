import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/contact_icon.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/participant_widget.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/styles.dart';

class RideDetailsSceen extends StatelessWidget {
  const RideDetailsSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return Column(
      children: [
        _showTtile(),
        _showSomeProfileInfo(),
        _showRideinfoSection(context),
        Transform.translate(
            offset: const Offset(0, -60),
            child: _shiwParticipantSection(context))
      ],
    );
  }

  Widget _showTtile() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.blackcolor,
                    )) ,
                Text(
                  "Details du l'offre",
                  style: Styles().h1TitleStyle(AppColors.primaryColor),
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  Widget _showSomeProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Habi Rouatbi',
                style: Styles().h1TitleStyle(AppColors.blackcolor),
              ),
              _showContactIcons(),
            ],
          ),
          const SizedBox(height: 10),
          _showRateWidget(),
          const SizedBox(height: 10),
          _showProfilDetailButton() , 
          const SizedBox(height: 10,)
        ],
      ),
    );
  }

  Widget _showContactIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContactIcon(icon: 'assets/icons/phone.png'),
        SizedBox(
          width: 15,
        ),
        ContactIcon(icon: 'assets/icons/message.png')
      ],
    );
  }

  Widget _showRateWidget() {
    return Container(
      width: 70,
      decoration: BoxDecoration(
          color: AppColors.cBackgroundDarkColor,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             SvgPicture.asset('assets/icons/star.svg') ,
            Text(
              '4.9',
              style: Styles().h2TextStyle(AppColors.cPrimaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _showProfilDetailButton() {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'More info ',
              style: TextStyle(
                  color: AppColors.cPrimaryColor,
                  fontSize: AppDimens.h3Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
         /*   Image(
                height: 20,
                width: 20,
                image: AssetImage(
                  'assets/icons/arrow_right.png',
                ))*/
          ],
        ),
      ),
    );
  }

  Widget _showRideinfoSection(BuildContext context) {
    return Container(
      height: AppUtility().contentHeight(context) * 0.35,
      decoration: const BoxDecoration(
          color: AppColors.cAccentDarkColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 24),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _showRidePriceSection(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        color: AppColors.cPrimaryColor,
                      ),
                      Text('12h',
                          style: Styles()
                              .h2TextStyleRoboto(AppColors.cPrimaryColor))
                    ],
                  )
                ],
              ),
            ),
            Expanded(flex: 2, child: _showLocationSection()),
            const Expanded(flex: 2, child: SizedBox())
          ],
        ),
      ),
    );
  }

  Widget _showRidePriceSection() {
    return Container(
      width: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/wallet_yellow.svg',
            ),
            Text('20 TND', style: Styles().priceStyle())
          ],
        ),
      ),
    );
  }

  Widget _showKilometerAndTimesection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '12 Km',
          style: Styles().h6TextStyle(AppColors.accentColor),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/clock.svg',
              color: AppColors.cPrimaryColor,
            ),
            Text('12h',
                style: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor))
          ],
        )
      ],
    );
  }

  Widget _showLocationSection() {
    return const Row(
      children: [
        DottedLine(
          lineColor: AppColors.cPrimaryColor,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Kalaa seghira ,sousse'),
            Text('Kalaa seghira ,sousse')
          ],
        )
      ],
    );
  }

  Widget _shiwParticipantSection(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 265,
          width: AppUtility().contentWidth(context),
          decoration: const BoxDecoration(
              color: AppColors.cPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: ((context, index) {
                  return const ParticipantWidget(
                    imageUrl:
                        'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                    radius: 30,
                    name: 'habib Rouatbi',
                  );
                })),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PrimaryButton(text: 'Book', onPressed: () {}),
        )
      ],
    );
  }
}
