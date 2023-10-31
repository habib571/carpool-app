
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/otp_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatelessWidget {
  final OtpVerificationController _controller = Get.find<OtpVerificationController>() ;
  OtpVerificationPage({Key? key}) : super(key: key);
  final number = Get.arguments;
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

  Widget _showBody(BuildContext context) {
    return Padding(
      padding: AppDimens.pagePadding,
      child: SingleChildScrollView(
        child: SizedBox(
          height: AppUtility().contentHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 0,
              ),
              _showImage(context),
              _showTitle(),
              _showOtpSection(context),
              _showVerifyButton(context),
              GetX<OtpVerificationController>(builder: (_) {
                return _.start.value == 0
                    ? _showResendSection(context)
                    : _showTimerSection();
              }),
              const SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showImage(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) * .35,
        child: Image.asset('assets/images/otp_verification.png'));
  }

  Widget _showTitle() {
    return Text(
      'verify code',
      style: Styles().subHeaderStyle(AppColors.cPrimaryColor,
          AppDimens.mediumSize, AppFonts.poppinsRegular),
      textAlign: TextAlign.center,
    );
  }

  Widget _showOtpSection(BuildContext context) {
    return Form(
      key: _controller.otpKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: PinCodeTextField(
          appContext: context,
          controller: _controller.otpController,
          length: 6,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (val) {
            return _controller.otpValidate(val!);
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(20),
              fieldHeight: 45,
              fieldWidth: 45,
              selectedColor: AppColors.cAccentColor,
              inactiveColor: AppColors.cBorderColor,
              activeColor: AppColors.cBorderColor,
              inactiveFillColor: AppColors.cBorderColor,
              selectedFillColor: AppColors.cBorderColor,
              activeFillColor: AppColors.cBorderColor,
              borderWidth: 1.2),
          keyboardType: TextInputType.number,
          animationDuration: const Duration(milliseconds: 300),
          // errorAnimationController: _authController.errorController,
          // controller: _authController.otpController,
          textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.cPrimaryColor,
              fontSize: 28,
              fontFamily: AppFonts.robotoRegular),
        ),
      ),
    );
  }

  Widget _showVerifyButton(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0),
      // padding: EdgeInsets.only(top:70.0,left: 10.0,bottom: 50.0,right: 10.0),
      child: PrimaryButton(
        text: 'Verify',
        onPressed: () async {
          if (_controller.otpKey.currentState!.validate()) {
            await _controller.verifyOtp(context);
          }
        },
      ),
    );
  }

  Widget _showResendSection(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Receive SMS',
          style:
              Styles().mediumTextStyle(const Color.fromARGB(255, 68, 97, 155)),
          children: <TextSpan>[
            TextSpan(
                text: 'Resend Code',
                style: Styles().mediumTextStyle(AppColors.cPrimaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _controller.resendOtp('29923303', context);
                  })
          ]),
    );
  }

  Widget _showTimerSection() {
    return Row(
      children: [
        Text(
          'Resend in',
          style:
              Styles().mediumTextStyle(const Color.fromARGB(255, 68, 97, 155)),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() {
          return Text(
            '${_controller.start.value}',
            style: Styles().mediumTextStyle(AppColors.cPrimaryColor),
          );
        }),
      ],
    );
  }
}
