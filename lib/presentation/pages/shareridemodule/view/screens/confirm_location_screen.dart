/*import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/widgets/form_widget.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_form_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/styles.dart';

class CondfirmLocationScreen extends StatelessWidget {
  CondfirmLocationScreen({super.key});
  final RideSharingController _controller = Get.find<RideSharingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
              Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Center(
              child:  Text(
                     'Publications',
                    style: Styles().h1TitleStyle(AppColors.primaryColor),
                  ),
            ),
          ) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: _showBody(),
            )
          ],
        ),
      ),
    );
  } 

  Widget _showBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _pickupSection(),
        _dropOffSection(),
        _showButton()
      ],
    );
  }

  Widget _pickupSection() {
    return FormSection(
        label: 'Pickup Location',
        controller: _controller.dateController,
        focusNode: _controller.dateFocusNode,
        hintext: 'Adress',
        ontapIcon: () {},
        iconUrl: 'assets/icons/maps.png' ,
        scale: 0.5
        ,
        );
  }

  Widget _dropOffSection() {
    return FormSection(
        label: 'Drop Off',
        controller: _controller.timeController,
        focusNode: _controller.timeFocusNode,
        hintext: 'Adress',
        ontapIcon: () {},
        iconUrl: 'assets/icons/maps.png',
        scale: 0.5,
          );
  }
 
  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: PrimaryButton(
        onPressed: () {},
        text: 'Confirmer',
      ),
    );
  }
}
*/
