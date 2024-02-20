import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/date_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/location_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/search_result_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/Info_card.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/passenger_widet.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/styles.dart';
import '../../viewmodel/searchride_viewmodel.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SearchRideScreen extends StatelessWidget {
  SearchRideScreen({super.key});
  final SearchRideController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.cPrimaryColor,
      //  backgroundColor: AppColors.p
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context) {
    return Column(
      children: [ 
        
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Positioned(
                top: 75,
                right: 80,
                child: SvgPicture.asset("assets/images/cloud.svg"),
              ),
              Center(child: SvgPicture.asset('assets/images/birds.svg')),
              Center(child: SvgPicture.asset('assets/images/tower_vector.svg')),
              Positioned(
                  left: 65,
                  bottom: 100,
                  child: SvgPicture.asset("assets/images/tree.svg")),
              Positioned(
                  left: 70,
                  bottom: 70,
                  child: SvgPicture.asset("assets/images/car.svg")),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _showLocationSection(context),
                ),
                Row(
                  children: [
                    Expanded(child: PassengerCard()),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(child: _showdDateSection())
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _showButton()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _showLocationSection(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(()=>const LocationScreen()) ;
      },
      child: Container(
        height: AppUtility().contentHeight(context) * 0.2,
        decoration: BoxDecoration(
            color: AppColors.accentColor,
            //border: Border.all(color: AppColors.greyColor, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DottedLine(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
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
                          AppStrings.locationAddress,
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
                    flex: 8,
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
                          AppStrings.locationAddress,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _showdDateSection() {
    return GetX<SearchRideController>(builder: (_) {
      return InfoCard(
          assetName: "assets/icons/filled_calendar.svg",
          ontap: () {
            Get.to(() => SelectDateScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 700));
          },
          infoTxt: 'Date',
          date: _.date.value != ''
              ? _.date.value
              : DateFormat('yyyy-MM-dd').format(DateTime.now()));
    });
  }

  /*Widget _showPassengerSection() { 
     return InfoCard(
      assetName: 'assets/icons/filled_user.svg',
       ontap: () {},
        infoTxt: 'Passengers',
        
         ) ;
   }  */
  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: PrimaryButton(
        onPressed: () {
          Get.to(()=> const SearchResultScreen()) ;
        },
        text: 'Find',
      ),
    );
  }
}
