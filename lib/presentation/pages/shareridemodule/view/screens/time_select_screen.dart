import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_share_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';

class WheelPickerExample extends StatefulWidget {
  const WheelPickerExample({super.key});

  @override
  State<WheelPickerExample> createState() => _WheelPickerExampleState();
}

class _WheelPickerExampleState extends State<WheelPickerExample> {
  final RideSharingController _ct = Get.find();
  final now = TimeOfDay.now();
  late final hoursWheel = WheelPickerController(
    itemCount: 24,
    initialIndex: now.hour % 24,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [hoursWheel],
  );

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 32.0,
      height: 1.5,
      fontFamily: 'Poppins',
    );
    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    return Scaffold(
      body: Column(
        children: [ 
           _showCancelButton() ,
          Expanded(  flex: 1, child: _showTitle()),
          Expanded( 
          flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WheelPicker(
                  builder: itemBuilder,
                  controller: hoursWheel,
                  looping: false,
                  style: wheelStyle,
                  selectedIndexColor: AppColors.primaryColor,
                ),
                const Text(":", style: textStyle),
                WheelPicker(
                  builder: itemBuilder,
                  controller: minutesWheel,
                  style: wheelStyle,
                  enableTap: true,
                  selectedIndexColor: AppColors.primaryColor,
                )
              ],
            ),
          ),
          
          Expanded( 
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                  text: 'select time',
                  onPressed: () {
                    _ct.timeController.text=
                        '${hoursWheel.selected.toString().padLeft(2,'0') }:${minutesWheel.selected.toString().padLeft(2,'0') }';
                          Get.back() ;
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    super.dispose();
  }

  Widget _centerBar(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _showTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Text(
        'When Are You Going',
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: AppDimens.largeSize,
            fontFamily: AppFonts.poppinsSemiBold,
            height: 1),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showCancelButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 25, left: 20),
      child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Image(
                  height: 35,
                  width: 35,
                  image: AssetImage('assets/icons/cross.png')))),
    );
  } 
  
}
