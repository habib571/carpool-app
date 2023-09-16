
import 'package:carpooling/app/di.dart';
import 'package:carpooling/main.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../component/text_form_fields.dart';

class NameSection extends StatelessWidget {
  const NameSection({super.key});
  //final  SignUpController _controller = instance<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return TextFormFields(
      autoFocus: false,
      //focusNode: _controller.nameFocusNode,
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