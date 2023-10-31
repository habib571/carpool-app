import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/component/top_bar.dart';
import 'package:carpooling/presentation/pages/sharidemodule/view/screens/no_rides_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareRideScreen extends StatelessWidget {
  const ShareRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 25 ,right: 10) ,
      child: Column(
          children: [
            const TopBar(title: 'Publications') ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30) ,
              child: Column(
                children: [
                  // const RideCard() ,
                   const SizedBox(height: 15,),
                  // const RideCard() , 
                   const SizedBox(height: 40,), 
                   PrimaryButton(
                    onPressed: () {  
                     Get.to(()=>const NoRidesScreen());
                    } , 
                    text: 'Add post',
                    
                    )
                ], 
              ),
                            )

          ],
      ),
      );
  }
}