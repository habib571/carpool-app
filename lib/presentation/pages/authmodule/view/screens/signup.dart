import 'package:carpooling/app/di.dart';
import 'package:carpooling/data/datasource/remote/auth_remote_data.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/repo_impl.dart';
import 'package:carpooling/domain/repository/repository.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/register_uscase.dart';
import 'package:carpooling/main.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/loginpage.dart';
import 'package:carpooling/presentation/pages/authmodule/view/widgets/loginbutt.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';
import '../widgets/email.dart';
import '../widgets/name.dart';
import '../widgets/password.dart';
import '../widgets/socialbuton.dart';


class SignUpPage extends StatelessWidget {
    SignUpPage({Key? key}) : super(key: key);
 //final SignUpController _controller = instance<SignUpController>() ; 
 final SignUpController _controller = Get.put(SignUpController(RegisterUseCase(AuthRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()) ,AuthRemoteDataSourceImp() )))) ;
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
      key: _controller.signUpFormKey,
      child: ListView(
        padding: AppDimens.pagePadding,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          _showImage(context),
          _showTitle(),
           NameSection(),
           EmailSection( 
            controller: _controller.emailcoltrollerS,
            //focusNode: _controller.emailFocusNode,
            ),
           GetX<SignUpController>(
             builder: (ctx) {
               return PasswordSection( 
                  hintext: 'Password',
                  controller: _controller.passwordcontrollerS,
                 // focusNode: _controller.passFocusNode ,
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
              ontap: () {
               _controller.register() ;
              },
               txt: 'Sign Up'
               ),
          _showSignInSection(),
          _showDivider(),
          SocialMediaButtons(
              fbOnPressed: (){},
              gOnPressed: (){},
              tOnPressed: (){}
          ),
        const  SizedBox(height: 50),
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
                    AppColors.cPrimaryColor
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                     Get.off(()=>LoginPage()) ;
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