import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/rides_usecase.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/date_select_screen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/loacation_scree.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/time_select_screen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/widgets/drop_down_button.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/widgets/form_widget.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_share_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/styles.dart';

// ignore: must_be_immutable
class RideFormScreen extends StatelessWidget {
  RideFormScreen({super.key});
  final RideSharingController _controller = Get.put(
    RideSharingController(CreateRideUseCase(RidesRepositoryImp(
        NetworkInfoImpl(InternetConnectionChecker()),
        RideRemoteDatsourceImp()))),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cPrimaryColor,
      body: Form(
        key: _controller.formKey,
        child: SingleChildScrollView( 
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Center(
                  child: Text(
                    'Publications',
                    style: Styles().h1TitleStyle(AppColors.primaryColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: _showBody(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showBody(BuildContext contex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showDateSection(),
        _showTimeSection(contex),
        _showMoneySection(),
        DropDownButt(label: 'Available Places'),
        _showButton(),
      ],
    );
  }

  Widget _showDateSection() {
    return FormSection(  
      validator: (val) { 
        return _controller.validate(val!) ;
      },
      readOnly: true,
      label: 'Date',
      controller: _controller.dateController,
      focusNode: _controller.dateFocusNode,
      hintext: 'Tap here choose date ',
      ontap: () {
        Get.to(() => SelectDatePage(),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 700));
      },
      iconUrl: 'assets/icons/blue_calendar.png',
      scale: 0.8,
    );
  }

  Widget _showTimeSection(BuildContext context) {
    return FormSection(  
        validator: (val) { 
        return _controller.validate(val!) ;
      },
      label: 'Time', 
      readOnly: true,
      controller: _controller.timeController,
      focusNode: _controller.timeFocusNode,
      hintext: 'Tap Here to choose time',
      ontap: () {
         Get.to(() => const WheelPickerExample(),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 700));
      },
      iconUrl: 'assets/icons/clock.png',
      scale: 0.8,
    );
  }

  Widget _showMoneySection() {
    return FormSection( 
         validator: (val) { 
        return _controller.validate(val!) ;
      },
        label: 'Price per Person',
        controller: _controller.priceController,
        focusNode: _controller.priceFocusNode,
        hintext: 'TND',
        ontap: () {},
        iconUrl: 'assets/icons/money.png',
        scale: 0.8);
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: PrimaryButton(
        onPressed: () {
          if (_controller.formKey.currentState!.validate()) {
            Get.off(() => const LocationScren());
          }
        },  
        text: 'Confirmer',
      ),
    );
  }
}
