import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';
import '../../viewmodel/searchride_viewmodel.dart';

class PassengerCard extends StatelessWidget {
  PassengerCard({super.key});
  final SearchRideController _controller = Get.put(SearchRideController(RideRemoteDatsourceImp()));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppUtility().contentHeight(context) * 0.15,
      decoration: BoxDecoration(
          color: AppColors.cPrimaryColor,

          //      border: Border.all(color: AppColors.greyColor, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/filled_user.svg'),
            Text('Passengers',
                style: Styles().pTextStyle(AppColors.blackcolor)),
            GetX<SearchRideController>(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        _controller.decrementPassenger();
                      },
                      child: Image(
                          height: 30,
                          width: 30,
                          image: const AssetImage('assets/icons/minus.png'),
                          color: _.passengerNumber.value > 1
                              ? AppColors.primaryColor
                              : AppColors.greyColor)),
                  Text(
                    _controller.passengerNumber.value.toString(),
                    style: const TextStyle(
                      color: AppColors.cTextColor,
                      fontFamily: AppFonts.robotoRegular,
                      fontSize: AppDimens.headingSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        _controller.incrementPassneger();
                      },
                      child: Image(
                          height: 30,
                          width: 30,
                          image: const AssetImage('assets/icons/add_blue.png'),
                          color: _.passengerNumber.value < 8
                              ? AppColors.primaryColor
                              : AppColors.greyColor)),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
