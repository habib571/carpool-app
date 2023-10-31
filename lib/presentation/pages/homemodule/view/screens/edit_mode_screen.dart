import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/homemodule/view/widgets/username_field.dart';
import 'package:carpooling/presentation/pages/homemodule/viewmodel/edit_profil_view_model.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditModeScreen extends StatelessWidget {
  EditModeScreen({super.key});
  final EditProfilController _controller = Get.find<EditProfilController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          _showBody()
        ],
      ),
    );
  }

  Widget _showBody() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _showImage()),
            const SizedBox(
              width: 20,
            ),

            Expanded(flex: 5, child: _builForms()),
          ],
        ),
        _showButtons()
      ],
    );
  }

  Widget _showImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/person_avatar.png'),
          radius: 65,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          
          child: MaterialButton(
            elevation: 2,
            onPressed: () {},
            shape: const CircleBorder(),
            color: Colors.white,
            child: const Icon(Icons.edit, color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }

  Widget _builForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditField(
            focusNode: _controller.nameFocusNode,
            txtcontroller: _controller.usernameC,
            validator: (val) {
              return null;
            },
            hintText: 'username',
            inputType: TextInputType.text),
        const SizedBox(
          height: 12,
        ),
        EditField(
            focusNode: _controller.nameFocusNode,
            txtcontroller: _controller.usernameC,
            validator: (val) {
              return null;
            },
            hintText: 'Phone Number ',
            inputType: TextInputType.number),
        const SizedBox(
          height: 12,
        ),
        EditField(
            focusNode: _controller.nameFocusNode,
            txtcontroller: _controller.usernameC,
            validator: (val) {
              return null;
            },
            hintText: 'age',
            inputType: TextInputType.number),
        const SizedBox(
          height: 12,
        ),
        _selectGender()
      ],
    );
  }

  Widget _selectGender() {
    return GetX<EditProfilController>(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio<GenderSelect>( 
               activeColor: AppColors.primaryColor,
                value: GenderSelect.male,
                groupValue: _.gender.value,
                onChanged: (value) {
                  _controller.gender(value);
                },
              ),
              Text(
                'Male ',
                style: Styles().h4TextStyle(AppColors.blackcolor),
              ),
            ],
          ),
          //const SizedBox(width: 25,) ,

          Row(
            children: [
              Radio<GenderSelect>(
                activeColor: AppColors.primaryColor, 
                value: GenderSelect.female,
                groupValue: _.gender.value,
                onChanged: (value) {
                  _controller.gender(value);
                },
              ),
              Text(
                'Female',
                style: Styles().h4TextStyle(AppColors.blackcolor),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _showButtons() {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
              buttonColor: Colors.white,
              borderColor: AppColors.greyColor,
              text: 'Decline',
              btnTxtStyle: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () {}),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: PrimaryButton(
              buttonColor: AppColors.primaryColor,
              text: 'Submit',
              btnTxtStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () {}),
        ),
      ],
    );
  }
}
