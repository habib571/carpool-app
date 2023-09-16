

import 'package:carpooling/presentation/pages/authmodule/viewmodel/loginviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/styles.dart';

class ForgotPasswprdSection extends StatelessWidget {
   ForgotPasswprdSection({super.key});
  final LoginController _controller  = Get.put(LoginController()) ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        InkWell(
          child: GetX<LoginController>(
            builder: (_){
              return Container(
                height: 18.0,
                width: 18.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.cAccentColor,
                    width: 1.6
                  ),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: _.onTap.value
                    ? const Icon(Icons.check,size: 13,color: AppColors.cAccentColor,)
                    : null,
              );
            },
          ),
          onTap: (){
            _controller.onTap.value = !_controller.onTap.value;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left:6.0),
          child: Text(
            'Remember Me' ,
            style: Styles().subHeaderStyle(
                AppColors.cAccentColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
          ),
        ),
       const Spacer(),
        TextButton(
          onPressed: (){
       
          },
          child: Text(
            'Forgot Password',
            style: Styles().subHeaderStyle(
                AppColors.cTextMediumColor,
                AppDimens.subTextSize,
                AppFonts.robotoRegular
            ),
          )
        )
      ],
    );
  }
}