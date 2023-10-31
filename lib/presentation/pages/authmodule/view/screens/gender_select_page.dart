
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/authmodule/view/screens/signup.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GenderPage extends StatelessWidget {
 GenderPage({super.key});
final SignUpController _controller = Get.find<SignUpController>() ;
  @override
  Widget build(BuildContext context) {
     final mediaQueryData = MediaQuery.of(context);
    return  MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0), 
      child: Scaffold(
        backgroundColor: AppColors.cBackgroundColor, 
        body: _showBody(context),
      ) 
      );
  } 



  Widget _showBody(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showTitle(),
          _showDiscription(),
          _showImageSection(context),
          _showButton(),
        ],
      ),
    );
  }

 Widget _showTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text( 
        'Select Gender',
      
        style: Styles().titleHeadingStyle(),
      ),
    );
  }

  Widget _showDiscription() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
      child: Text(
          'Select Your Gender',
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showImageSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: InkWell(
            onTap: () {
              _controller.gender('male');
              //print(_controller.isMale.value);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: GetX<SignUpController>(
                    builder: (_) {
                      return _.gender.value =='male'
                          ? Image.asset(
                              'assets/icons/male.png',
                              height:
                                  AppUtility().contentWidth(context) * .35,
                              width: AppUtility().contentWidth(context) * .4,
                            )
                          : Image.asset(
                              'assets/icons/male_bw.png',
                              height:
                                  AppUtility().contentWidth(context) * .35,
                              width: AppUtility().contentWidth(context) * .4,
                            );
                    },
                  ),
                ),
                // Text(
                //   AppStrings.male,
                //   style: Styles().subHeaderStyle(AppColors.cPrimaryColor,
                //       AppDimens.mediumTextSize, AppFonts.robotoRegular),
                // ),
              ],
            ),
          ),
        ),
       const Spacer(),
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: InkWell(
            onTap: () {
              _controller.gender('female') ;
            //  print(_controller.isMale.value);
            },
            child: Column(
              children: [
                GetX<SignUpController>(
                  builder: (_) {
                    return _.gender.value =='male'
                        ? Image.asset(
                            'assets/icons/female_bw.png',
                            height: AppUtility().contentWidth(context) * .35,
                            width: AppUtility().contentWidth(context) * .4,
                          )
                        : Image.asset(
                            'assets/icons/female.png',
                            height: AppUtility().contentWidth(context) * .35,
                            width: AppUtility().contentWidth(context) * .4,
                          );
                  },
                ),
                // Text(
                //   AppStrings.female,
                //   style: Styles().subHeaderStyle(AppColors.cTextLightColor,
                //       AppDimens.mediumTextSize, AppFonts.robotoRegular),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0, left: 10.0, right: 10.0),
      child: PrimaryButton(
        buttonColor: AppColors.cAccentColor,
        text: 'Next',
        onPressed: () { 
          Get.to(()=>SignUpPage()) ;
          
         
        },
      ),
    );
  }

}