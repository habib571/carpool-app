import 'package:carpooling/presentation/pages/authmodule/view/screens/signup.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/email.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/forgetpass.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/loginbutt.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/password.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/socialbuton.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/loginviewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
   final LoginController _controller = Get.put(LoginController()) ; 

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
      key: _controller.formKey,
      child: ListView(
        padding: AppDimens.containerPadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
          _showFields(),
           AuthButton(
            ontap: () { }, 
            txt: 'Login',
            ),
          _showSinUpSection(),
          _showDivider(),
          SocialMediaButtons(
            fbOnPressed: (){},
            gOnPressed: (){},
            tOnPressed: (){}
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/login_image.png')
    );
  }

  Widget _showTitle(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Welcome Back',
            style: Styles().titleHeadingStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Please login to your account',
          style: Styles().descriptionStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

Widget _showFields(){
    return  Column(
      children: [
         Padding(
          padding:const EdgeInsets.only(top: 35.0, bottom: 8.0),
          child: EmailSection(
            controller: _controller.emailcoltrollerL,
            // focusNode: _controller.sEmailFocusNode 
             )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: GetX<LoginController>(
            builder: (ctx) {
              return PasswordSection( 
                 controller: _controller.passwordcontrollerL,
                hintext: 'Password',
                 // focusNode:_controller.sPassFocusNode ,
                  isobscure:ctx.isLPassObscure.value ,
                  ontapIcon: () {
                    ctx.isLPassObscure.value = !ctx.isLPassObscure.value ;
                      }, 
                    eyeIcon:!ctx.isLPassObscure.value
                  ? SvgPicture.asset('assets/icons/eye.svg')
                  : SvgPicture.asset('assets/icons/eye_strike.svg'),
                   );
            }
          )
        ),
        Padding(
          padding:const  EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ForgotPasswprdSection()
        ),
      ],
    );
}


 
  Widget _showSinUpSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Not a Member yet? ',
          style: Styles().mediumTextStyle(
              AppColors.cTextMediumColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'Sign Up',
                style: Styles().mediumTextStyle(
                    AppColors.cPrimaryColor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.off( SignUpPage()) ;
                  }
            )
          ]
      ),
    );
  }

  Widget _showDivider(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Row(
        children: [
      const    Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             'or',
              style: Styles().subHeaderStyle(
                  AppColors.cPrimaryColor,
                  AppDimens.subTextSize,
                  AppFonts.robotoRegular
              ),
            ),
          ),
       const   Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
        ],
      ),
    );
  }

}
