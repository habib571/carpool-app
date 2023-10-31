
import 'package:carpooling/presentation/pages/authmodule/view/widgets/email.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/loginbutt.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/forgot_pass_viewmodem.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPassPage extends StatelessWidget {
 final ForgotPasswordcontroller _controller = Get.find<ForgotPasswordcontroller>() ;
   ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
    
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.cBackgroundColor,
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext context){
    return Form(
      key: _controller.forgotformKey,
      child: ListView(
        padding: AppDimens.pagePadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
          _showDiscription(),
            EmailSection(
              focusNode: _controller.fEmailFocusNode,
               controller: _controller.fEmailcontroller,
                validator: (val) {
                  return _controller.validateEmail(val!) ;
                }
                ),

          AuthButton(
            ontap: () {
         _controller.sendEmail(context) ;
            },
             txt: 'Send'
             )
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
      height: AppUtility().contentWidth(context) *.8,
      padding:AppDimens.containerPadding,
      child: Image.asset('assets/images/forgot_pass.png'),
    );
  }

  Widget _showTitle(){
    return Text(
      'Forgot Password',
      style: Styles().titleHeadingStyle(),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDiscription(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0,top: 10.0),
      child: Text(
        'forgot desc',
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }






}
