
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../component/text_form_fields.dart';
import '../../../../utils/app_colors.dart';

class EmailSection extends StatelessWidget {
   const EmailSection({
     super.key,
     required this.focusNode,  
     required this.controller,
     required this.validator

    }); 
    final FocusNode focusNode ; 
    final TextEditingController controller; 
   final String? Function(String? s)? validator ;
 
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:17.0),
      child: TextFormFields(   
           autoFocus: false,
        validator: validator ,
        textEditingController: controller,
         focusNode: focusNode, 
        textInputAction: TextInputAction.next,
        hintText:'Email',
        isPrefixIcon: true,
        filled: false,
        textInputType: TextInputType.emailAddress,
        prefixIcon: Transform.scale(
        scale: 0.32,
        // ignore: deprecated_member_use
        child:   SvgPicture.asset('assets/icons/mail_icon.svg', color: AppColors.greyColor)
        ),
        borderRadius:const  BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}