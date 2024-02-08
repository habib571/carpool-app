import 'package:carpooling/data/datasource/remote/rides_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/rides_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_ride_uses_case.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/shareridemodule/viewmodel/ride_info_view_model.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../common/state_render_imp.dart';
import '../../../../utils/app_colors.dart';
import '../widgets/ridec_card.dart';

class ShareRideScreen extends StatelessWidget {
  ShareRideScreen({super.key});

  final RideInfoController _controller = Get.find() ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  StreamBuilder<FlowState>( 
          stream:_controller.outputState,
          builder:(context ,snapshot) {
             return snapshot.data?.getScreenWidget(context, _showBody(), () {_controller.start() ;} ) ?? 
             _showBody() ;
           
          }
           )
    );
  } 

  Widget _showBody() { 
     return Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 30) ,
              child: Column(
                children: [
                    RideCard(  
                   time: _controller.ride?.time ?? '' ,
                   price :  _controller.ride?.price ?? '' ,
                   distance: '20',
                  to: _controller.ride?.to ?? '' ,  
                  date: _controller.ride?.date ?? ''  ,
                  from: _controller.ride?.from ?? '',
                  accecpted:  '' ,
                  waiting: _controller.ride?.seats.toString() ?? '' ,
                    ) ,
           
                   const SizedBox(height: 40,), 
                   PrimaryButton(
                    onPressed: () {  
        
                    } , 
                    text: 'Add post',
                    
                    )
                ], 
              ),
                            )
      
          ],
      );
  }
}