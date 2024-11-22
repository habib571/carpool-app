
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../component/text_form_fields.dart';

class NameSection extends StatelessWidget {
  const NameSection({
    super.key, 
    required this.nameFocusNode,
    required this.txtcontroller ,
    required this.validator , 
    required  this.hint

     });
  final FocusNode  nameFocusNode ; 
  final TextEditingController txtcontroller ;
  final String? Function(String? s)? validator ;
  final String hint ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:17.0),
      child: TextFormFields(   
        autoFocus: false,
        validator: validator ,
        textEditingController: txtcontroller,
        focusNode: nameFocusNode,
        hintText: hint,
        isPrefixIcon: true,
        filled: false,
        textInputType: TextInputType.text,
        prefixIcon: Transform.scale(
            scale: 0.32,
            // ignore: deprecated_member_use
            child: SvgPicture.asset('assets/icons/user.svg',color: AppColors.greyColor)
        ),
        textInputAction: TextInputAction.done,
        borderRadius:const BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}