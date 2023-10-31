import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({super.key});

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
          _showCalendarSection(),
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

Widget _showCalendarSection() { 
   return Container(
          decoration: BoxDecoration(
            color: AppColors.cCardColor,
            borderRadius: BorderRadius.circular(8.0)
          ),
          padding:const EdgeInsets.symmetric(horizontal:10.0,vertical: 35.0),
          child: SfDateRangePicker(
            enablePastDates: false,
            headerHeight: 50,
            view: DateRangePickerView.month,
            showNavigationArrow: false,
            headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor)
            ),
            selectionColor: AppColors.cAccentColor,
            yearCellStyle: DateRangePickerYearCellStyle(
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              leadingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              disabledDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              todayTextStyle: Styles().h2TextStyleRoboto(AppColors.cAccentColor),
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
              leadingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              trailingDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              disabledDatesTextStyle: Styles().h2TextStyleRoboto(AppColors.cDateInActiveColor),
              todayTextStyle: Styles().h2TextStyleRoboto(AppColors.cAccentColor),
            ),
            monthViewSettings: DateRangePickerMonthViewSettings(
              dayFormat: 'E',
              viewHeaderHeight: 40.0,
              showTrailingAndLeadingDates: true,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: Styles().h5TextStyle(AppColors.cDateColor)
              ),
            ),
            selectionTextStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
            selectionMode: DateRangePickerSelectionMode.single,
            rangeSelectionColor: AppColors.cTextLightColor,
            endRangeSelectionColor: AppColors.cTextLightColor,
            startRangeSelectionColor: AppColors.cTextLightColor,
            todayHighlightColor: AppColors.cAccentColor,
            toggleDaySelection: true,
            rangeTextStyle: Styles().h2TextStyleRoboto(AppColors.cPrimaryColor),
            initialSelectedDate: DateTime.now(),
            // initialSelectedRange: PickerDateRange(
            //     DateTime.now().subtract(const Duration(days: 4)),
            //     DateTime.now().add(const Duration(days: 3))
            // ),
            onSelectionChanged:(args){
            
            },
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