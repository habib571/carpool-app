import 'dart:io';

import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/widgets/gende_card.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/widgets/username_field.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/edit_profil_viewmodel.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../app/contants.dart';
import '../../../../common/state_render_imp.dart';

// ignore: must_be_immutable
class EditModeScreen extends StatelessWidget {
  EditModeScreen({super.key});

  final ProfilController _ctx = Get.find<ProfilController>(); 
   final EditProfilController _controller = Get.find<EditProfilController>(); 
 String? imagePath ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cPrimaryColor,
      body: 
      
     Form( 
         key: _controller.formKey,
         child: SingleChildScrollView( 
          scrollDirection: Axis.vertical,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20) ,
             child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                StreamBuilder<FlowState>(
              stream: _controller.outputState,
              builder: (context, snapshot) {
                return snapshot.data?.getScreenWidget(context, _showBody(context),
                        () {
                      _controller.start();
                    }) ??
                    _showBody(context);
              })
              ],
                   ),
           ),
         ),
      ),
    );
  }

  Widget _showBody(BuildContext context) {
    return Column(
      children: [
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Center(
              child: Text(
                          'Edit Profil',
                          style: Styles().h1TitleStyle(AppColors.primaryColor),
                        ),
             ),
           ) ,
        const SizedBox(
          height: 40,
        ),
      _showImage(context) ,
      const SizedBox(height: 30) , 
      _builForms() , 
       const SizedBox(height: 30) ,  
       _selectGenderSection() , 
       const SizedBox(height: 30) ,   
       _showButton() 

      ],
    );
  }
 
  Widget _showImage(BuildContext context) {
    return GetX<EditProfilController>(
      builder: (_) {
        return Stack(
          alignment: Alignment.center,
          children: [  
               // ignore: unnecessary_null_comparison
               _.imagePath.value  != '' 
                  ?  ClipRRect(    
                    borderRadius: BorderRadius.circular(AppUtility().contentHeight(context) * .2),  
                      child: CircleAvatar(
                           radius: AppUtility().contentWidth(context) * .17,
                        child: Image.file(
                          File(_.imagePath.value),
                        width: AppUtility().contentWidth(context)* .34,
                        height: AppUtility().contentHeight(context)* .34, 
                        fit:  BoxFit.cover,
                         ), 
                      )
                                        )
                  : ClipRRect(
        
          child:  CircleAvatar( 
            radius: AppUtility().contentWidth(context) * .17,
          backgroundImage: NetworkImage( 
           '${Constants.baseUrl}/storage/${_ctx.user!.picture}' , 
           headers: {
            'Accept' : 'application/json' , 
             'Content-Type' : 'application/json'
           }
          
          ),
          ) 
        ) ,
            
            Positioned(
              bottom: 80,
              left: 50,
              child: MaterialButton(
                elevation: 2,
                onPressed: () {
                  _showBottomSheet(context);
                },
                shape: const CircleBorder(),
                color: Colors.white,
                child: const Icon(Icons.edit, color: AppColors.primaryColor),
              ),
            )
          ],
        );
      }
    );
  }

  Widget _builForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         GetX<EditProfilController>(
          builder: (_) {
            return EditField(   
              readOnly: _.modifMode.value ? false : true ,
              icon: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset( 
                  'assets/icons/user.svg' ,
                  height:  20, 
                  width: 20, 
                  // ignore: deprecated_member_use
                  color:_.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor,
                  ),
              ),   
             onSaved: (val) =>  _controller.fname.value =val!  ,
               initVal:  _ctx.user!.firstName!,
                focusNode: _controller.fnameFocusNode,
                validator: (val) {
                  return null;
                },
               borderColor: _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor, 
               focusBorderColor:  _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor, 
                hintText: 'First Name',
                inputType: TextInputType.text);
          }
        ),
        const SizedBox(
          height: 12,
        ),
        GetX<EditProfilController>(
          builder: (_) {
            return EditField(  
              readOnly: _.modifMode.value? false: true,
              icon: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(
                  'assets/icons/user.svg' , 
                    height:  20, 
                    width: 20, 
                    // ignore: deprecated_member_use
                    color: _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor, 
                  ),
              ), 
                 initVal: _ctx.user!.lastName!, 
                 onSaved: (val) =>  _controller.lname.value =val!  ,
                focusNode: _controller.lnameFocusNode,
                  borderColor: _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor, 
               focusBorderColor:  _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor, 
                validator: (val) {
                  return null;
                },
                hintText: 'Last Name',
                inputType: TextInputType.text);
          }
        ),
        const SizedBox(
          height: 12,
        ),
    
        const SizedBox(
          height: 12,
        ),
        

      ],
    );
  }

  Widget _showButton() {
    return  GetX<EditProfilController>(
      builder: (_) {
        return PrimaryButton( 
                 buttonColor:_.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor,
                  borderColor:   _.modifMode.value? AppColors.cGreenColor : AppColors.primaryColor ,
                  text:  !_.modifMode.value ? 'Cliquer pour modifier' :'Enregistrer les modifications' ,  
                  btnTxtStyle: const TextStyle(
                      color: AppColors.cPrimaryColor ,
                      fontSize: AppDimens.h2Size,
                      fontFamily: AppFonts.robotoRegular,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppDimens.letterSpace),
                  onPressed: () { 


                     if (_controller.formKey.currentState!.validate()) {
                         _controller.formKey.currentState!.save();
                          _controller.switchMode() ; 
                    if(!_.modifMode.value) {
                        _controller.updateInfo() ;
                    }
                        }
                      }
                    
    
                  );
      }
    ) ;
  }

   Widget _selectGenderSection() { 
            return Row( 
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [ 
                GetX<EditProfilController>(
                  builder: (_) {
                    return GenderCard(  
                      txtColor:  _.gender.value == 'male' ? AppColors.primaryColor : AppColors.greyColor ,
                      iconColor:  _.gender.value == 'male' ? AppColors.primaryColor : AppColors.greyColor, 
                      bordercolor:   _.gender.value == 'male' ? AppColors.primaryColor : AppColors.greyColor, 
                    iconPath: 'assets/icons/male.png',
                     gender: 'Male',
                      ontap: ()  {  
                        if(_controller.modifMode.value) { 
                             _controller.gender('male') ;
                            }      
                         
                      }
                      );
                  }
                ) , 
                    GetX<EditProfilController>(
                  builder: (_) {
                    return GenderCard(  
                      txtColor:   _.gender.value == 'female' ? AppColors.secondaryColor : AppColors.greyColor ,
                      iconColor:   _.gender.value == 'female' ? AppColors.secondaryColor : AppColors.greyColor, 
                      bordercolor:   _.gender.value == 'female' ? AppColors.secondaryColor : AppColors.greyColor, 
                    iconPath: 'assets/icons/female.png',
                     gender: 'Female',
                      ontap: ()  {  
                            if(_controller.modifMode.value) { 
                             _controller.gender('female') ;
                            }
                        
                      
                      }
                      );
                  }
                ) , 
              ],
            ) ;    
   }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: AppUtility().contentHeight(context) * .03,
                bottom: AppUtility().contentHeight(context) * .05 ,
                left: AppUtility().contentHeight(context) * .05 
                ),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space
              SizedBox(height: AppUtility().contentHeight(context) * .02),//buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          fixedSize: Size(
                              AppUtility().contentWidth(context) * .3,
                              AppUtility().contentHeight(context) * .15)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) { 

                     _controller.imagePath.value = image.path;  
                     await _controller.updatePicure(image.path) ;

                          Get.back(); //
                        }
                      },
                      child: const Icon(Icons.add)),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          fixedSize: Size(
                              AppUtility().contentHeight(context) * .3,
                              AppUtility().contentHeight(context) * .15)),
                      onPressed: () async {
                        // await _controller.uploadPicture(ImageSource.camera) ;
                      },
                      child: const Icon(Icons.add_a_photo_rounded)),
                ],
              )
            ],
          );
        });
  }
}
