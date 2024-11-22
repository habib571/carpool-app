import 'package:carpooling/presentation/pages/profilmodule/view/widgets/setting_widget.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/application_bar.dart';
import '../../../../utils/app_dimens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar( 
        isProfile: false,
        title: 'Settings',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon:const Icon(Icons.arrow_back)
        ),
      ),
      body: _showBody(),
    );
  } 


  Widget _showBody(){
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: AppDimens.pagePadding,
      children: [
    
        _showSettingsImage(),
        _buildSettingsCard(),
      ],
    );
  }


  Widget _showSettingsImage(){
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 30.0,bottom: 60.0),
          height: 150.0,
          child: Image.asset('assets/images/setting_circle.png')
      ),
    );
  }

  Widget _buildSettingsCard(){
    return GetX<ProfilController>(
       builder :(_){
         return Container(
           decoration: BoxDecoration(
               color: AppColors.cPrimaryColor,
               borderRadius: BorderRadius.circular(12.0)
           ),
           padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 5.0),
           child: Column(
             children: [
               SettingWidget(
                 title: 'Show trafic on the map',
                 activeSwitch: _.trafficSwitch.value,
                 onClick: (){
                   _.trafficSwitch.value = !_.trafficSwitch.value;
                 },
               ),
             
              SettingWidget(
                 title: 'Turn on notifications',
                 activeSwitch: _.notificationSwitch.value,
                 onClick: (){
                   _.notificationSwitch.value = !_.notificationSwitch.value;
                 },
               ),
               SettingWidget(
                 title: 'Shoiw driver where I am',
                 activeSwitch: _.driverSwitch.value,
                 onClick: (){
                   _.driverSwitch.value = !_.driverSwitch.value;
                 },
               ),
             ],
           ),
         );
       }
    );
  }
}