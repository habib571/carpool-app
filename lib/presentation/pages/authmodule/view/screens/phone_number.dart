
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/common/state_render_imp.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/authmodule/viewmodel/signupviewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberPage extends StatelessWidget {

final SignUpController _controller = Get.find<SignUpController>() ;
   PhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.cBackgroundColor,
        body: StreamBuilder<FlowState>( 
          stream:_controller.outputState,
          builder:(context ,snapshot) {
             return snapshot.data?.getScreenWidget(context, _showBody(context), () {_controller.start() ;} ) ?? _showBody(context); 
             
          }
           )
      ),
    );
  }

Widget _showBody(BuildContext context){
  return Form( 
    key: _controller.pohneNumberformKey,
    child: SingleChildScrollView(
      child: Container(
        padding: AppDimens.pagePadding,
      height:AppUtility().contentHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _showImage(context),
            _showTitle(),
            _showDescription(),
            _showPhoneField(context),
            _showVerifyButton(context),
            _showResendSection(),
          ],
        ),
      ),
    ),
  );
}

  Widget _showImage(BuildContext context){
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: AppUtility().contentHeight(context) *.35,
        child: Image.asset('assets/images/mobile_verification.png'),
    );
  }

  Widget _showTitle(){
    return Text(
     'Phone Number',
      style: Styles().subHeaderStyle(
          AppColors.cPrimaryColor,
          AppDimens.mediumSize,
          AppFonts.poppinsRegular
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showDescription(){
    return Padding(
      padding: const EdgeInsets.only(top:0.0,bottom: 0.0),
      child: Text(
        'mobile.enterMobile'.tr,
        style: Styles().descriptionStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _showPhoneField(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cLightNavyBlueColor,
        borderRadius: BorderRadius.circular(6.0)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3.0),
      margin: const EdgeInsets.only(top:40.0),
     child: InternationalPhoneNumberInput( 
        validator:(val){
          return _controller.validatePhoneNumber(val!) ;
        } ,
         onInputChanged: (PhoneNumber number) {},
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig:const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        textStyle:const TextStyle(
          color: AppColors.cPrimaryColor,
        ),
        spaceBetweenSelectorAndTextField: 0.0,
        ignoreBlank: true,
        maxLength: 10,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle:const TextStyle(color: AppColors.cPrimaryColor),
        initialValue: _controller.number,
        textFieldController: _controller.phonenumber,
        formatInput: false, 
       
        //countries: const ['Tu'],
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'mobile phone number',
          hintStyle: Styles().mediumTextStyle(AppColors.cPrimaryColor)
        ),
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }


Widget _showVerifyButton(BuildContext context){
    return Padding(
      padding:const EdgeInsets.only(top:0.0,left: 10.0,bottom: 0.0,right: 10.0),
      child: PrimaryButton(
        text: 'Submit',
        onPressed: () async{ 
          if(_controller.pohneNumberformKey.currentState!.validate()) {
        await _controller.register(context) ; 
         Get.toNamed(Approutes.verifyOtp,arguments: _controller.phonenumber.text) ;
        }},
      ),
    );
  }

  Widget _showResendSection(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Don’t Receive SMS?',
        style: Styles().mediumTextStyle(
          AppColors.cTextLightColor
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Resend.'.tr,
            style: Styles().mediumTextStyle(
                AppColors.cPrimaryColor
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
               // _controller.pohneNumberformKey.currentState!.validate();
              }
          )
        ]
      ),
    );
  }

}
