import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/book_ride_use_case.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/messagesmodule/view/screens/messages_screen.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/widget/contact_icon.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/widget/participant_widget.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/ride_details_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../common/state_render_imp.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/styles.dart';

class RideDetailsSceen extends StatelessWidget {
  RideDetailsSceen({super.key});
  final RideDetailsController _controller = Get.put(RideDetailsController(
      BookRideUseCase(RidesRepositoryImp(
          NetworkInfoImpl(InternetConnectionChecker()),
          RideRemoteDatsourceImp()))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<FlowState>(
            stream: _controller.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, _showBody(context),
                      () {
                    _controller.start();
                  }) ??
                  _showBody(context);
            }));
  }

  Widget _showBody(BuildContext context) {
    return Column(
      children: [
        _showTtile(),
        _showSomeProfileInfo(),
        _showRideinfoSection(context),
        Transform.translate(
            offset: const Offset(0, -50),
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
                    )),
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
                _controller.ride.name!,
                style: Styles().h1TitleStyle(AppColors.blackcolor),
              ),
              _showContactIcons(),
            ],
          ),
          const SizedBox(height: 10),
          _showRateWidget(),
          const SizedBox(height: 10),
          _showProfilDetailButton(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _showContactIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              _controller.callDriver();
            },
            child: const ContactIcon(icon: 'assets/icons/phone.png')),
        const SizedBox(
          width: 15,
        ),
        InkWell(
            onTap: () { 
              Get.to(()=>ChatScreen(), arguments: _controller.ride.driverId) ;
            },
            child: const ContactIcon(icon: 'assets/icons/message.png'))
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
            SvgPicture.asset('assets/icons/star.svg'),
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
    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: 0,
      height: 35,
      color: AppColors.primaryColor,
      child: Text(
        'Rate the driver',
        style: Styles().subHeaderStyle(
          AppColors.cPrimaryColor,
          AppDimens.h3Size,
          AppFonts.robotoRegular,
        ),
      ),
      onPressed: () { 
        Get.toNamed(Approutes.driverProfile) ;
      },
    );
  }

  Widget _showRideinfoSection(BuildContext context) {
    return Container(
      height: AppUtility().contentHeight(context) * 0.33,
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
                      Text(_controller.ride.time!,
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
      width: 105,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/wallet_yellow.svg',
            ),
            Text(_controller.ride.price!, style: Styles().priceStyle())
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
    return Row(
      children: [
        const DottedLine(
          lineColor: AppColors.cPrimaryColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(_controller.ride.from!), Text(_controller.ride.to!)],
        )
      ],
    );
  }

  Widget _shiwParticipantSection(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppUtility().contentHeight(context) * 0.35,
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
          child: PrimaryButton(
              text: 'Book',
              onPressed: () {
                _controller.bookRide();
              }),
        )
      ],
    );
  }
}
