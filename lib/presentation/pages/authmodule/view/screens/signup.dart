import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/loginbutt.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';
import '../widgets/email.dart';
import '../widgets/name.dart';
import '../widgets/password.dart';


class SignUpPage extends StatelessWidget {
    SignUpPage({Key? key}) : super(key: key);
final SignUpController _controller = Get.find<SignUpController>() ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      body: _showBody(context),
    );
  }

  Widget _showBody(BuildContext context){
    return Form(
      key: _controller.signUpFormKey,
      child: ListView(
        padding: AppDimens.pagePadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
           NameSection( 
            validator: (val) {
              return _controller.validateName(val!) ;
            },
            nameFocusNode: _controller.firstFocusNode,
             txtcontroller: _controller.firstname ,
             hint: 'Firstname',
             ),
              NameSection( 
            validator: (val) {
              return _controller.validateName(val!) ;
            },
            nameFocusNode: _controller.lastFocusNode,
             txtcontroller: _controller.lastname ,
             hint: 'Lastname',
             ),
           EmailSection( 
            validator: (val) {
            return   _controller.validateEmail(val!) ;
            },
            controller: _controller.emailcontrollerS,
            focusNode: _controller.emailFocusNode,
            ),
           GetX<SignUpController>(
             builder: (ctx) {
               return PasswordSection(  
                validator: (val) { 
                 return _controller.validatePassword(val!) ;
                },
                  hintext: 'Password',
                  controller: _controller.passwordcontrollerS,
                  focusNode: _controller.passFocusNode ,
                  isobscure: ctx.isSPassObscure.value,
                  eyeIcon:!ctx.isSPassObscure.value
                  ? SvgPicture.asset('assets/icons/eye.svg')
                  : SvgPicture.asset('assets/icons/eye_strike.svg') ,
                  ontapIcon: () { 
                            ctx.isSPassObscure.value = !ctx.isSPassObscure.value ;
                   },
                  );
              }
                 ),
            AuthButton(
              ontap: ()  { 
                if(_controller.signUpFormKey.currentState!.validate()) { 
                   Get.offAllNamed
                   (Approutes.phonenNumber) ;
                }
              },
               txt: 'Sign Up'
               ),
         _showSignInSection(),
         /* _showDivider(),
          SocialMediaButtons(
              fbOnPressed: (){},
              gOnPressed: (){},
              tOnPressed: (){}
          ),
        const  SizedBox(height: 50),*/
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/signup_image.png')
    );
  }

  Widget _showTitle(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Text(
            'Create Profile',
            style: Styles().titleHeadingStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(
            'Please create your profil',
            style: Styles().descriptionStyle(),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }


  Widget _showSignInSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Not member yet ',
          style: Styles().mediumTextStyle(
              AppColors.cTextMediumColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: ' Sign In',
                style: Styles().mediumTextStyle(
                    AppColors.blackcolor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                     Get.offAllNamed(Approutes.login ) ;
                  }
            )
          ]
      ),
    );
  }

  Widget _showDivider(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
         const Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
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
         const Expanded(child: Divider(thickness: 1,color: AppColors.cTextMediumColor,)),
        ],
      ),
    );
  }

}
