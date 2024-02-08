
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class LocationForm extends StatelessWidget {
  LocationForm(
      {super.key,
      required this.startAddressController,
      required this.destinationController,
      required this.draggableScrollableController,
      required this.startaddress,
      required this.destinationAddress,
      required this.startFocusNode, 
      required this.items,
      required this.onTxtTap,
      required this.destinationFocusNode,
         this.validator,   
      required this.confirmButt,
       required this.cancelButt
  });

  final TextEditingController startAddressController;
  final TextEditingController destinationController;
  final DraggableScrollableController draggableScrollableController;
  String? startaddress;
  final String destinationAddress;
  final FocusNode startFocusNode;   
  final FocusNode destinationFocusNode ;
  final Widget items ;  
  final Function onTxtTap ;  
  final String? Function(String? s)? validator; 
  final Widget confirmButt ;
   final Widget cancelButt;
  


 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Container
        const SizedBox(),
        // Second Container
        Expanded(
          child: DraggableScrollableSheet(   
            
            minChildSize: 0.35,
            initialChildSize: 0.35,
            controller: draggableScrollableController,
            builder: (context, scrollController) {
              return Container( 
                decoration: const BoxDecoration( 
                    
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppColors.cPrimaryColor),
                child: SingleChildScrollView( 
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Column( 
                      children: [ 
                         cancelButt ,
                        TextFormFields(    
                           isBorder: false,
                          validator:  validator ,
                          fillColor: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(8) ,
                          hintText: 'Pickup Location' ,
                          autoFocus: false,
                          textInputAction: TextInputAction.done,
                          focusNode: startFocusNode,
                          textEditingController: startAddressController,
                          onTap: () {   
                           onTxtTap() ;
                        
                          },   
                          
                          isSuffixIcon: true,
                          suffixIcon: SvgPicture.asset('assets/icons/blue_loc.svg') ,
                          suffixIconConstraints: const BoxConstraints(minHeight: 17 , minWidth: 40),
                        ) ,     
                        const SizedBox(height: 20,) , 
                        TextFormFields(     
                          isBorder: false,
                           validator:  validator ,
                            fillColor: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(8) ,
                             hintText: 'Drop off Location' ,
                             autoFocus: false,
                             textInputAction: TextInputAction.done,
                             focusNode: destinationFocusNode,
                             textEditingController: destinationController,
                             onTap: () {   
                              onTxtTap() ;
                          }, 
                          
                          isSuffixIcon: true,
                          suffixIconConstraints:const BoxConstraints(minHeight: 17 , minWidth: 40),
                        suffixIcon: SvgPicture.asset('assets/icons/blue_loc.svg')
                        ) ,    
                        items , 
                        const SizedBox(height: 20,) , 
                        confirmButt  ,
                      const SizedBox(height: 10),

                     
                        

                        // Add more widgets as needed
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
