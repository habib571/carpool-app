

import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/Info_card.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/styles.dart';

class SearchRideScreen extends StatelessWidget {
  const SearchRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      //backgroundColor: AppColors.cPrimaryColor,
      body: 
       _showBody(context),
    ) ;
  }  
Widget _showBody(BuildContext context) { 
   return  Column(
     children: [ 
        Expanded( 
         flex: 4,
          child: Stack( 
           children: [  
            Positioned( 
              top: 75, 
              right: 80,
              child: SvgPicture.asset("assets/images/cloud.svg") ,
              ),
             Center(child: SvgPicture.asset('assets/images/birds.svg')) , 
              Center(child: SvgPicture.asset('assets/images/tower_vector.svg')) , 
             Positioned( 
               left: 65,  
               bottom: 100,
               child: SvgPicture.asset("assets/images/tree.svg")
               ) , 
             
             Positioned(  
              left: 70,
              bottom: 70,
              child: SvgPicture.asset("assets/images/car.svg")) , 
            
           ],
               ),
        ) , 
    Expanded( 
      flex: 5, 
      child: Padding(
        padding: const EdgeInsets.all(17) ,  
         child:  Column(
             children: [ 
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _showLocationSection(context),
              ) , 
              Row(
                children: [
                  Expanded(child: _showPassengerSection()) , 
                  const SizedBox(width: 25,) ,
                  Expanded(child: _showdDateSection())
                ],
              ) ,  
               SizedBox(height: 20,) ,
              _showButton() 
             ],
         ),
         
        ),
    )
     ],
   ) ;
   }  
  Widget _showLocationSection(BuildContext context) { 
     return  Container( 
        height: AppUtility().contentHeight(context) * 0.2 ,
        decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor, width: 1),
),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 25) ,
         child: Row( 
               crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
           children: [ 
            const DottedLine() ,
             Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
           
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'from',
                        style: Styles().h5TextStyle(
                          AppColors.cTextLightColor,
                        ),
                      ),
                      Text(
                    AppStrings.locationAddress,
                    style: Styles().pTextStyle(
                      AppColors.cBackgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                      
                
                    ],
                  ),
                ),
                 
                // _showFromAddress(),
                const Divider(
                  thickness: 1,
                  color: AppColors.cBorderLineColor,
                ),
                 

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'to',
                        style: Styles().h5TextStyle(
                          AppColors.cTextLightColor,
                        ),
                      ),
                      Text(
                    AppStrings.locationAddress,
                    style: Styles().pTextStyle(
                      AppColors.cBackgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                    ],
                  ),
                ),
               
                // _showToAddress(),
              ],
                 ),
           ],
         ),
       ),
     );
   
     
   } 
   Widget _showdDateSection() { 
     return  InfoCard(
      assetName: "assets/icons/filled_calendar.svg",
      ontap: () {},
      infoTxt: 'Demain',
       widget: const SizedBox()
       ) ; 
   } 
   Widget _showPassengerSection() { 
     return InfoCard(
      assetName: 'assets/icons/filled_calendar.svg',
       ontap: () {},
        infoTxt: 'Passengers',
         widget: Text(
          '1' , 
          style: Styles().h2TextStyleRoboto(AppColors.blackcolor),
          )
         ) ;
   } 
   Widget _showButton() { 
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 35),
       child: PrimaryButton(
        onPressed: () { 
           
        } 
        ,
         text: 'Find',
        ),
     ) ;
   }
} 
