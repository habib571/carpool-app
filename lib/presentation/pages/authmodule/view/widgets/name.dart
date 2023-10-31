
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../component/text_form_fields.dart';

class NameSection extends StatelessWidget {
  const NameSection({
    super.key, 
    required this.nameFocusNode,
    required this.txtcontroller ,
    required this.validator

     });
  final FocusNode  nameFocusNode ; 
  final TextEditingController txtcontroller ;
   final String? Function(String? s)? validator ;

  @override
  Widget build(BuildContext context) {
    return TextFormFields(  
      validator: validator ,
      textEditingController: txtcontroller,
      autoFocus: false,
      focusNode: nameFocusNode,
      hintText: 'Name',
      isPrefixIcon: true,
      filled: false,
      textInputType: TextInputType.text,
      prefixIcon: Transform.scale(
          scale: 0.32,
          child: SvgPicture.asset('assets/icons/user.svg')
      ),
      textInputAction: TextInputAction.newline,
      borderRadius:const BorderRadius.all(Radius.circular(10.0)),
    );
  }
}