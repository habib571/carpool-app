import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/component/top_bar.dart';
import 'package:carpooling/presentation/pages/sharidemodule/view/screens/rid_from_screen.dart';
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
          const TopBar(title: 'Publications') ,
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