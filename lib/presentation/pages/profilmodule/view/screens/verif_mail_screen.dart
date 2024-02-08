import 'package:carpooling/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../component/primary_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.cScaffoldColor,
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _showImage(context),
          _showTitleSection(),
          const Spacer(),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _showImage(BuildContext context) {
    return Container(
      height: AppUtility().contentWidth(context) * .9,
      padding: AppDimens.containerPadding,
      child: Image.asset('assets/images/email_check.png'),
    );
  }

  Widget _showTitleSection() {
    return Column(
      children: [
        _showTitle(),
        _showDescription(),
      ],
    );
  }

  Widget _showTitle() {
    return Text(
      'check email',
      style: Styles().titleHeadingStyle(),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDescription() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, top: 10.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Verify Your Email',
            style: Styles().subHeaderStyle(AppColors.cTextMediumColor,
                AppDimens.subTextSize, AppFonts.robotoRegular),
            children: <TextSpan>[
              TextSpan(
                text: AppStrings.emailText,
                style: Styles().subHeaderStyle(AppColors.textSecondaryColor,
                    AppDimens.subTextSize, AppFonts.robotoRegular),
              ),
            ]),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0, right: 10.0, left: 10.0),
      child: PrimaryButton(
        text: 'Send',
        onPressed: () {},
      ),
    );
  }
}
