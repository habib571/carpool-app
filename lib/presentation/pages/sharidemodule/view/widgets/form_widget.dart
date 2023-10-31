import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key, required this.label, required this.controller, required this.focusNode, required this.hintext, required this.ontapIcon, required this.iconUrl, required this.scale});
 final String label ; 
 final TextEditingController controller ;
 final FocusNode focusNode ; 
 final String hintext ; 
 final Function ontapIcon ;     
 final String iconUrl ;
 final double scale ;
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [ 
          Text( 
            label  ,
            style: Styles().h2TextStyleRoboto(AppColors.blackcolor),
          ) ,
          const SizedBox(height: 8) ,
          TextFormFields(  
            autoFocus: false,
           textInputAction: TextInputAction.done,
            textEditingController: controller, 
            focusNode: focusNode,
            hintText: hintext, 
            hintStyle: const TextStyle(
            fontFamily: AppFonts.robotoRegular,
            fontSize: AppDimens.subTextSize,
            color: AppColors.cTextLightColor,
        ),
           isSuffixIcon: true ,
           suffixIcon: Transform.scale(
           scale: scale,
            child: InkWell(
              onTap: (){
              ontapIcon() ;     /* ctx.isLPassObscure.value = !ctx.isLPassObscure.value;*/
              },
              child: Image(
                image: AssetImage(iconUrl) ,
                             ) 
                  
            )

            
          )
    

        ),
      ])
    ) ;
  }
}