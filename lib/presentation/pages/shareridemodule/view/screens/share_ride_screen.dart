
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_info_view_model.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/state_render_imp.dart';
import '../../../../utils/app_colors.dart';
import '../widgets/ridec_card.dart';

class ShareRideScreen extends StatelessWidget {
  ShareRideScreen({super.key});

  final RideInfoController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      floatingActionButton: FloatingActionButton(onPressed: () {}),
        body: StreamBuilder<FlowState>(
            stream: _controller.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, _showBody(context),
                      () {
                    _controller.start();
                  }) ??
                  _showBody(context);
            }));
  }

  Widget _showBody(BuildContext context) {
    return Column(
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              RideCard(
                time: _controller.ride?.time ?? '',
                price: _controller.ride?.price ?? '',
                distance: '20',
                to: _controller.ride?.to ?? '',
                date: _controller.ride?.date ?? '',
                from: _controller.ride?.from ?? '',
                accecpted: '',
                waiting: _controller.ride?.seats.toString() ?? '',
              ),
              SizedBox(height: AppUtility().contentHeight(context) * 0.27),
              PrimaryButton( 
               
                onPressed: () {},
                text: 'Update',
              ), 
              const SizedBox(height: 20,) ,
              PrimaryButton( 
                widget: const Icon(Icons.delete),
                borderColor: AppColors.secondaryColor,
                buttonColor: AppColors.secondaryColor,
                onPressed: () {
                  _controller.deletRide() ;
                },
                text: 'Delete',
              )
            ],
          ),
        )
      ],
    );
  }
}
