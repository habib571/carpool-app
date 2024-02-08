import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  FormSection({
    super.key,
    required this.label,
    required this.controller, 
    required this.focusNode,
    required this.hintext,
    required this.ontap,
    required this.iconUrl,
    required this.scale,
     this.readOnly =false , 
     this.textInputType = TextInputType.number,
    this.validator
     });
 final String label ; 
 final TextEditingController controller ;
 final FocusNode focusNode ; 
 final String hintext ; 
 final Function() ontap;     
 final String iconUrl ;
 final double scale ; 
 bool readOnly ; 
 TextInputType textInputType ;
  final String? Function(String? s)? validator;
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [ 
          Text( 
            label  ,
            style: Styles().h3TextStyle(AppColors.blackcolor)
          ) ,
          const SizedBox(height: 8) ,
          TextFormFields(     
            validator: validator,  
            onTap: ontap , 
            readOnly: readOnly,
             textInputType: textInputType,
             borderRadius: BorderRadius.circular(15),
             isBorder: false,
            autoFocus: false,
           textInputAction: TextInputAction.done,
            textEditingController: controller, 
            focusNode: focusNode,
            hintText: hintext, 
            hintStyle: const TextStyle(
            fontFamily: AppFonts.robotoRegular,
            fontSize: AppDimens.subTextSize,
            color: AppColors.cTextColor,
        ),
           isSuffixIcon: true ,
           suffixIcon: Transform.scale(
           scale: scale,
            child: Image(
              image: AssetImage(iconUrl) ,
                           )

            
          )
    

        ),
      ])
    ) ;
  }
}