import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/rid_from_screen.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoRidesScreen extends StatelessWidget {
  const NoRidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column( 
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [ 
                const Expanded(child: SizedBox()) ,
                Expanded(
                  child: Text(
                    'No Rides So Far' ,
                    style: Styles().h2TextStyle(AppColors.greyColor)
                       ),
                ) ,
                  const Expanded( 
                    flex: 2,
                    child: Image(image: AssetImage('assets/icons/block.png'))
                  ) ,
                  Expanded(
                    flex: 2,
                    child: PrimaryButton(
                    onPressed: () { 
                        Get.to(RideFormScreen()) ; 
                      } , 
                      text: 'Add Ride',   
                      )
                    ) 
              ],
            ),
          )
          ), 
         const Expanded(child: SizedBox())
        ],
            ),
    ) ;
  }
}