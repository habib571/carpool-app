import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../profilmodule/view/widgets/gende_card.dart';

class GenderPage extends StatelessWidget {
  GenderPage({super.key});
  final SignUpController _controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: AppColors.cScaffoldColor,
          body: _showBody(context),
        ));
  }

  Widget _showBody(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showTitle(),
          SizedBox(height: 50),
          // _showDiscription(),
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
        GetX<SignUpController>(builder: (_) {
          return GenderCard(
              txtColor: _.gender.value == 'male'
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              iconColor: _.gender.value == 'male'
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              bordercolor: _.gender.value == 'male'
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              iconPath: 'assets/icons/male.png',
              gender: 'Male',
              ontap: () {
                _controller.gender('male');
              });
        }),
        const Spacer() ,
        GetX<SignUpController>(builder: (_) {
          return GenderCard(
              txtColor: _.gender.value == 'female'
                  ? AppColors.secondaryColor
                  : AppColors.greyColor,
              iconColor: _.gender.value == 'female'
                  ? AppColors.secondaryColor
                  : AppColors.greyColor,
              bordercolor: _.gender.value == 'female'
                  ? AppColors.secondaryColor
                  : AppColors.greyColor,
              iconPath: 'assets/icons/female.png',
              gender: 'Female',
              ontap: () {
                _controller.gender('female');
              });
        }),
      ],
    );
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 180.0, left: 10.0, right: 10.0),
      child: PrimaryButton(
        buttonColor: AppColors.primaryColor,
        text: 'Next',
        onPressed: () {
          Get.toNamed(Approutes.signup);
        },
      ),
    );
  }
}
