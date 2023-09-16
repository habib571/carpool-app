
import 'package:carpooling/presentation/pages/authmodule/view/screens/signup.dart';
import 'package:carpooling/presentation/pages/onboarding/view/widgets/firstpage.dart';
import 'package:carpooling/presentation/pages/onboarding/view/widgets/secondpage.dart';
import 'package:carpooling/presentation/pages/onboarding/view/widgets/thirdpages.dart';
import 'package:carpooling/presentation/pages/onboarding/viewmodel/onboardingviewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimens.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardinScreen extends StatelessWidget {
   OnboardinScreen({super.key});
  final OnboardingController _controller = Get.put(OnboardingController()) ;
  @override
  Widget build(BuildContext context) {
       final mediaQueryData = MediaQuery.of(context);
  return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: _showBody()
      ),
    );
  } 

  Widget _showBody() { 
      return Stack(
      children: [
        PageView(
             onPageChanged: (int pageNumber) {
            if (pageNumber == 1) {
              _controller.isSkipDark(true);
              _controller.isLoginLight(false);
            } else if (pageNumber == 2) {
             _controller.isSkipDark(false);
              _controller.isLoginLight(true);
            } else {
             _controller.isSkipDark(false);
             _controller.isLoginLight(false);
            }
          },
          controller: _controller.welcomePageController,
          children: const [ 
            FirstPage()  ,
            SecondPage() , 
            ThirdPage()
          
          ],
        ),
        _showSkipButton(),
        _showDotSection(),
      ],
    );

  } 






  Widget _showSkipButton() {
    return Positioned(
        right: 0,
        top: 30,
        child: TextButton(
          child: GetX<OnboardingController>(
            builder: (_) {
              return _.isSkipDark.value
                ? Text(
                  'Skip',
                  style: Styles().subHeaderStyle(
                      AppColors.cIconLightColor,
                      AppDimens.smallTextSize,
                      AppFonts.robotoRegular
                  ),
                )
              : Text(
                   'Skip',
                    style: Styles().subHeaderStyle(AppColors.cPrimaryColor,
                        AppDimens.smallTextSize,
                        AppFonts.robotoRegular
                    ),
               );
            },
          ),
          onPressed: () {
          
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
          },
        )
    );
  }

  Widget _showDotSection() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Column(
        children: [
          _showPageIndicator(),
          _showLoginButton(),
        ],
      ),
    );
  }

  Widget _showPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SmoothPageIndicator(
        controller: _controller.welcomePageController,
        count: _controller.count,
        effect: const ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          spacing: 3.0,
          expansionFactor: 2.0,
          dotColor: AppColors.cPrimaryColor,
          activeDotColor: AppColors.cPrimaryColor,
        ),
      ),
    );
  }


  Widget _showLoginButton() {
    return GetX<OnboardingController>(
      builder: (_) {
        return RichText(
          text: TextSpan(
              text: "Welcome back!",
              style: Styles().mediumTextStyle(
                  _.isLoginLight.value
                  ? AppColors.cPrimaryColor
                  : AppColors.cTextBrownColor
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Log in',
                  style: _.isLoginLight.value
                      ? Styles().textSmallStyleLight()
                      : Styles().textSmallStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                     Get.to(()=>SignUpPage()) ;
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
                    }
                 )
              ]
          ),
        );
      },
    );
  }





}