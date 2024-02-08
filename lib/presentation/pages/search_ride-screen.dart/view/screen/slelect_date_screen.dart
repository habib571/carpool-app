import 'package:carpooling/presentation/component/custom_calendar.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_share_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({super.key});
  final RideSharingController _ct = Get.find() ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
         Padding(
           padding: const EdgeInsets.only(bottom: 30 ,top: 20 ,left:10),
           child: Align( 
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                  Get.back() ;
              }, 
              icon: const Icon(Icons.arrow_back)
              )
            ),
         ) ,
         _showBody()
        ],
      ),
    ) ;
  } 
    Widget _showBody(){
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showTitle(),
           CustomCalendar(),
          _showSetDateButton(),
        ],
      ),
    );
  }
Widget _showTitle() { 
  return const Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: Text(
        'When Are You Going',
        style:TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: AppDimens.largeSize,
            fontFamily: AppFonts.poppinsSemiBold,
            height: 1
        ),
        textAlign: TextAlign.center,
      ),
  );
}



  Widget _showSetDateButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Row(
        children: [
         const Expanded(flex: 1,child: Text('')),
          Expanded(
            flex: 9,
            child: PrimaryButton(
              text: 'Set Date',
              btnTxtStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              onPressed: (){ 
                 _ct.dateController.text = _ct.date.value ; 
                Get.back();
              }
            ),
          ),
          const Expanded(flex: 1,child: Text('')),
        ],
      ),
    );
  }

}