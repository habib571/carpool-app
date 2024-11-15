import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerScreen extends StatelessWidget {
  PassengerScreen({super.key});
  final SearchRideController _controller = Get.find<SearchRideController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showBody(),
    );
  }

  Widget _showBody() {
    return Column(
      children: [ _showTopBar(),_showTitle(), _showNumberSetion()],
    );
  }
 Widget _showTopBar() {
         return Padding(
           padding: const EdgeInsets.only(bottom: 30 ,top: 25 ,left:5),
           child: Align( 
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                  Get.back() ;
              }, 
              icon: const Icon(Icons.arrow_back)
              )
            ),
         ) ;
 }
  Widget _showTitle() {
    return  const Padding(
      padding: EdgeInsets.only(bottom: 30 ) ,
      child: Text(
        'Number Of Places',
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: AppDimens.largeSize,
            fontFamily: AppFonts.poppinsSemiBold,
            height: 1),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showNumberSetion() {
    return GetX<SearchRideController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                _controller.decrementPassenger();
              },
              child: Image(
                  image: const AssetImage('assets/icons/minus.png'),
                  color: _.passengerNumber.value > 1
                      ? AppColors.primaryColor
                      : AppColors.greyColor)), 
           Text(
              _controller.passengerNumber.value.toString() ,
              style: const TextStyle(
                      color: AppColors.cTextColor,
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.largeTextSize,
      fontWeight: FontWeight.w600, 
    
              ),
           ) ,          
          InkWell(
              onTap: () {
                _controller.incrementPassneger();
              },
              child: Image(
                  image: const AssetImage('assets/icons/add_blue.png'),
                  color: _.passengerNumber.value < 8
                      ? AppColors.primaryColor
                      : AppColors.greyColor)),
        ],
      );
    });
  }
}
