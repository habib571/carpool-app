import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_share_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import 'package:intl/intl.dart' ;
// ignore: must_be_immutable
class CustomCalendar extends StatelessWidget {
 CustomCalendar(
    {
      super.key , 
     
      }
    )
    ;
 final RideSharingController _controller = Get.find() ;

  @override
  Widget build(BuildContext context) {
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
             
              _controller.date.value = DateFormat('yyyy-MM-dd').format(args.value ?? DateTime.now()) ;
             
              
          
            },
          ),
        );
  }
}