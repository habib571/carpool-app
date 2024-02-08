import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../component/text_form_fields.dart';

class EditField extends StatelessWidget {
  const EditField({ 
    super.key, 
    required this.focusNode,
  
    required this.validator, 
    required this.hintText,
    required this.inputType, 
    required this.icon, 
    this.readOnly = true ,
     this.maxLines = 1  ,
    required this.initVal ,
     this.onSaved,  
     this.borderColor = AppColors.primaryColor,
     this.focusBorderColor = AppColors.primaryColor 
     

     });
  final FocusNode  focusNode ; 
  
  final String? Function(String? s)? validator ; 
  final String hintText ;
  final TextInputType inputType ;  
  final int maxLines ; 
  final String initVal ;
  final Function(String? s)? onSaved; 
  final Widget icon ; 
  final bool readOnly ; 
  final Color borderColor ;  
  final Color focusBorderColor ;

  
 

  @override
  Widget build(BuildContext context) {
    return TextFormFields(     
      
      focusBorderColor: focusBorderColor,
      borderColor: borderColor,
      onSaved: onSaved,
      readOnly: readOnly,
       prefixIcon: icon ,   
      initialValue: initVal,
      maxLines: maxLines, 
      fillColor: AppColors.accentColor,
      validator: validator ,
      autoFocus: false,
      focusNode: focusNode,
      hintText: hintText,
      isPrefixIcon: true, 
      filled: false,
      textInputType: inputType ,
      textInputAction: TextInputAction.newline,
      borderRadius:const BorderRadius.all(Radius.circular(10.0)),
    );
  }
}