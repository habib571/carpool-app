import 'package:flutter/material.dart';
import '../../../../component/text_form_fields.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';

class PasswordSection extends StatelessWidget {
   const PasswordSection({
   super.key, 
   required this.focusNode,
   required this.isobscure,
   required this.eyeIcon, 
   required this.ontapIcon,
   required this.hintext ,
   required this.controller,
   required this.validator
      });
final FocusNode focusNode ; 
final bool isobscure ; 
final Widget eyeIcon ; 
final Function() ontapIcon ; 
final String hintext ; 
final TextEditingController controller ;
final String? Function(String? s)? validator ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical:17.0),
      child: TextFormFields(   
        autoFocus: false,
        validator: validator,
        textEditingController: controller,
        obscureText:  isobscure/*ctx.isLPassObscure.value*/,
          focusNode:  focusNode ,/* _controller.sPassFocusNode,*/

        textInputAction: TextInputAction.done,
        hintText: hintext,
        hintStyle: const TextStyle(
          fontFamily: AppFonts.robotoRegular,
          fontSize: AppDimens.subTextSize,
          color: AppColors.cTextLightColor,
        ),
        filled: false,
        isPrefixIcon: true,
        textInputType: TextInputType.text,
        prefixIcon: Transform.scale(
         scale: 0.32,
          child: Image.asset('assets/icons/lock_icon.png' ,color: AppColors.greyColor,)
        ),
        isSuffixIcon: true,
        suffixIcon: Transform.scale(
            scale: 0.32,
            child: InkWell(
              onTap: (){
              ontapIcon() ;     /* ctx.isLPassObscure.value = !ctx.isLPassObscure.value;*/
              },
                child: eyeIcon /*!ctx.isLPassObscure.value
                    ? SvgPicture.asset('assets/icons/eye.svg')
                    : SvgPicture.asset('assets/icons/eye_strike.svg'),*/
            )
        ),
        borderRadius:const BorderRadius.all(Radius.circular(10.0)),
      ),
    ) ;
}}