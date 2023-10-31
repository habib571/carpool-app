import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/component/top_bar.dart';
import 'package:carpooling/presentation/pages/sharidemodule/view/screens/confirm_location_screen.dart';
import 'package:carpooling/presentation/pages/sharidemodule/view/widgets/drop_down_button.dart';
import 'package:carpooling/presentation/pages/sharidemodule/view/widgets/form_widget.dart';
import 'package:carpooling/presentation/pages/sharidemodule/viewmodel/ride_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideFormScreen extends StatelessWidget {
  RideFormScreen({super.key});
  final RideFormController _controller = Get.find<RideFormController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TopBar(title: 'Publish Ride'),
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
        _showDateSection(),
        _showTimeSection(),
        DropDownButt(label: 'Available Places'),
        _showButton()
      ],
    );
  }

  Widget _showDateSection() {
    return FormSection(
        label: 'Date',
        controller: _controller.dateController,
        focusNode: _controller.dateFocusNode,
        hintext: '23/10/2023',
        ontapIcon: () {},
        iconUrl: 'assets/icons/blue_calendar.png' ,
        scale: 0.8,
        );
  }

  Widget _showTimeSection() {
    return FormSection(
        label: 'Date',
        controller: _controller.timeController,
        focusNode: _controller.timeFocusNode,
        hintext: '10:50',
        ontapIcon: () {},
        iconUrl: 'assets/icons/clock.png',
        scale: 0.8,
        );
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: PrimaryButton(
        onPressed: () {
          Get.to(()=>CondfirmLocationScreen()) ;
        },
        text: 'Confirmer',
      ),
    );
  }
}
