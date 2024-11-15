import 'package:flutter/material.dart';

import '../../../../component/flutter_switch.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/styles.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, required this.title, required this.activeSwitch, this.onClick});
  final String title ; 
    final bool activeSwitch;
  final Function()? onClick; 
  @override
  Widget build(BuildContext context) {
    return ListTile(
          dense: true,
          title: Text(
           title,
            style: Styles().subHeaderStyle(
                AppColors.cTextGreyColor,
                AppDimens.mediumTextSize,
                AppFonts.robotoMedium
            ),
          ),
          trailing: FlutterSwitch(
            onTap: activeSwitch,
            onClick: onClick,
          ),
        );
  }
}