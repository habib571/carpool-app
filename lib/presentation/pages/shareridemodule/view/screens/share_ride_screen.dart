
import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_ride_uses_case.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/homemodule/view/screens/homescreen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_info_view_model.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../common/state_render_imp.dart';
import '../../../../utils/app_colors.dart';
import '../widgets/ridec_card.dart';

class ShareRideScreen extends StatelessWidget {
  ShareRideScreen({super.key});

  final RideInfoController _controller =  Get.put( RideInfoController(GetRidesUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()),RideRemoteDatsourceImp()))))  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar:  ApplicationBar(  
        
        isProfile: false,
        title: 'Publication',
        backgroundColor: AppColors.cPrimaryColor,
        isLeading: true,
        leading: IconButton(
            onPressed: (){
              Get.to(()=>const HomeScreen()) ;
            },
            icon:const Icon(Icons.arrow_back)
        ),
      ),
    
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
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              GetBuilder<RideInfoController>( 
                init: RideInfoController(GetRidesUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()) , RideRemoteDatsourceImp()) ,)),  
                builder: (context) {
                  return RideCard(
                    time: _controller.ride?.time ?? '',
                    price: _controller.ride?.price ?? '',
                    distance: '20',
                    to: _controller.ride?.to ?? '',
                    date: _controller.ride?.date ?? '',
                    from: _controller.ride?.from ?? '',
                    accecpted: '',
                    waiting: _controller.ride?.seats.toString() ?? '',
                  );
                }
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
