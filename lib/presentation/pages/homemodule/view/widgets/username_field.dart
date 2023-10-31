import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../component/text_form_fields.dart';

class EditField extends StatelessWidget {
  const EditField({
    super.key, 
    required this.focusNode,
    required this.txtcontroller ,
    required this.validator, 
    required this.hintText,
    required this.inputType,

     });
  final FocusNode  focusNode ; 
  final TextEditingController txtcontroller ;
  final String? Function(String? s)? validator ; 
  final String hintText ;
  final TextInputType inputType ; 
 

  @override
  Widget build(BuildContext context) {
    return TextFormFields(   
      fillColor: AppColors.accentColor,
      validator: validator ,
      textEditingController: txtcontroller,
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