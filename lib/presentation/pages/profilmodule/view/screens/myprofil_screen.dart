

import 'package:carpooling/app/contants.dart';
import 'package:carpooling/navigation/routes_constant.dart';
import 'package:carpooling/presentation/common/state_render_imp.dart';
import 'package:carpooling/presentation/component/primary_button.dart';
import 'package:carpooling/presentation/component/rich_dialog_box.dart';
import 'package:carpooling/presentation/component/top_bar.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/screens/verif_mail_screen.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/widgets/child_list_tile.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/widgets/ridesharer_button.dart';
import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfilMode extends StatelessWidget {
  ProfilMode({super.key});

  final ProfilController _controller = Get.find<ProfilController>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cPrimaryColor,
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
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        const TopBar(
          title: 'Profil',
          rFlex: 7,
          lFlex: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            _showImage(context),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            _ratingSection(),
            const SizedBox(
              height: 10,
            ), 
            _showName() ,
            const SizedBox(
              height: 10,
            ), 
            _verifyEmailSection() , 
            const SizedBox(height: 12,) ,
            _showVerifNumber() , 
            const SizedBox(height: 12,) ,

            _rideSharerButton(context), 
            const SizedBox(
              height: 10,
            ),
            _controller.user?.miniBio != ''
                ? _showMiniBio(context)
                : _showMiniBioButton(context),
            const SizedBox(height: 10),
            _showDivider(),
            _buildListItems(context)
          ]),
        )
      ],
    );
  }

  Widget _showImage( BuildContext context) {
    return ClipRRect(
    
      child:  CircleAvatar( 
        radius: AppUtility().contentWidth(context) * .17,
      backgroundImage: NetworkImage( 
       '${Constants.baseUrl}/storage/${_controller.user?.picture}' , 
       headers: {
        'Accept' : 'application/json' , 
         'Content-Type' : 'application/json'
       }
      
      ),
      )
    );
  } 

Widget _showName() { 
  return  Text(
            '${_controller.user?.lastName} ${_controller.user?.firstName} ',
                style: const TextStyle(
                    color: AppColors.blackcolor,
                    fontSize: AppDimens.titleSize,
                    fontFamily: AppFonts.poppinsRegular,
                    height: 1.1),
                //overflow: TextOverflow.clip,
              ) ;
} 

Widget _showVerifNumber() { 
   return Row(
        children: [
             SvgPicture.asset(
              'assets/icons/verified.svg' , 
              height: 24, 
              width: 24,
             ) ,
          const SizedBox(
            width: 10,
          ),
          Text(
            '${ _controller.user?.phoneNumber}',
            style: Styles().h2TextStyleRoboto(AppColors.greyColor),
          )
        ],
      );
}

  Widget _ratingSection() {
    return RatingBar.builder(
      itemSize: 15,
      initialRating: 3,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  } 

  Widget _showDivider() {
    return const Divider(
      thickness: 1,
      color: AppColors.greyColor,
    );
  }

  Widget _verifyEmailSection() {
    return InkWell(
      onTap: () {
        Get.to(() => const CheckEmailPage());
      },
      child: Row(
        children: [
             SvgPicture.asset(
              'assets/icons/add.svg' , 
              height: 24, 
              width: 24,
             ) ,
          const SizedBox(
            width: 10,
          ),
          Text(
            'Confirm Your mail adress',
            style: Styles().h2TextStyleRoboto(AppColors.greyColor),
          )
        ],
      ),
    );
  }

 /* Widget _showInformation( BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const  SizedBox(width: 10,) ,
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _showImage(context),
              const SizedBox(height: 8),
              _ratingSection()
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_controller.user!.lastName} ${_controller.user!.firstName} ',
                style: const TextStyle(
                    color: AppColors.blackcolor,
                    fontSize: AppDimens.titleSize,
                    fontFamily: AppFonts.poppinsRegular,
                    height: 1.1),
                //overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 7,
              ),
              _controller.user!.mailVerified!
                  ? InfoWidget(
                      imageUrl: 'assets/icons/mail.png',
                      title: _controller.user!.email!)
                  : const SizedBox(),
              InfoWidget(
                  imageUrl: 'assets/icons/phone.png',
                  title: _controller.user!.phoneNumber!),
              Row(
                children: [
                  InfoWidget(
                      imageUrl: 'assets/icons/gender.png',
                      title: _controller.user!.gender!),
                  const SizedBox(
                    width: 11,
                  ),
                  InfoWidget(
                      imageUrl: 'assets/icons/age.png',
                      // ignore: unnecessary_null_comparison
                      title: _controller.user!.age! != null
                          ? '${_controller.user!.age.toString()} Years old'
                          : 'N/A'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }*/

  Widget _showMiniBio(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mini Bio',
              style: Styles().h2TextStyle(AppColors.primaryColor),
            ),
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.accentColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                  /*  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _showDialogBioForm(context, 'update Bio');
                        });*/
                  },
                  child: const Image(
                    image: AssetImage('assets/icons/edit.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        GetBuilder<ProfilController>(
            init: _controller,
            builder: (_) {
              return RichText(
                  maxLines: 3,
                  text: TextSpan(
                      text: _.user?.miniBio,
                      style: Styles().pTextStyle(AppColors.blackcolor)));
            })
      ],
    );
  }

  Widget _rideSharerButton(BuildContext context) {
    return RideSharerbutton(
      onPressed: () {
   /*  showDialog(
            context: context,
            builder: (BuildContext context) {
              return _showDialogForm(context);
            })*/;
      },
      buttonColor: Colors.white,
      text: 'Become a Ridesharer',
    );
  }

  Widget _showMiniBioButton(BuildContext context) {
    return PrimaryButton(
      text: 'Add Mini Bio',
      onPressed: () {
      /*  showDialog(
            context: context,
            builder: (BuildContext context) {
              return _showDialogBioForm(context, 'Add Mini Bio');
            });*/
      },
    );
  }

  Widget _buildListItems(BuildContext context) {
    return Column(
      children: [
        ChildListTile(
          title: 'Profil info',
          icon: 'assets/icons/user.svg',
          onClick: () {
            Get.toNamed(Approutes.editprofil);
          },
        ),
        ChildListTile(
          title: 'Rides Details',
          icon: 'assets/icons/info.svg',
          onClick: () {},
        ),
        ChildListTile(
          title: 'Prefernces',
          icon: 'assets/icons/preferences.svg',
          onClick: () {},
        ),
        ChildListTile(
          title: 'Cars',
          icon: 'assets/icons/car.svg',
          onClick: () {},
        ),
        ChildListTile(
          title: 'Change password',
          icon: 'assets/icons/password.svg',
          onClick: () {},
        ),
        ChildListTile(
            title: 'Change phone number',
            icon: 'assets/icons/phone.svg',
            onClick: () {}),
        ChildListTile(
          title: 'Settings',
          icon: 'assets/icons/settings.svg',
          onClick: () {},
        ),
        ChildListTile(
          title: 'Logout',
          icon: 'assets/icons/logout.svg',
          onClick: () {},
        )
      ],
    );
  }

  Widget _showRideDetails() {
    return const Row(
      children: [
        Row(
          children: [
            Image(
                height: 20,
                width: 20,
                image: AssetImage('assets/icons/car_blue.png')),
            /*    Image(
               height: 20, 
              width: 20,
              image: AssetImage('assets/icons/check.png')) , */
            Text(
              '10 Completed',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimens.h4Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
          ],
        ),
        SizedBox(width: 20),
        Row(
          children: [
            Image(
                height: 20,
                width: 20,
                image: AssetImage('assets/icons/car_red.png')),
            /*  Image(
               height: 20, 
              width: 20,
              image: AssetImage('assets/icons/rejected.png')),*/
            Text(
              '4 Incompleted',
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: AppDimens.h4Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
          ],
        ),
      ],
    );
  }

 /* Widget _showDialogForm(BuildContext context) {
    return RichDialogBox(
      title: 'Add your car Brand',
      form: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: EditField(
            focusNode: _controller.carBrandfocusNode,
            txtcontroller: _controller.carBrandController,
            validator: (va) {
              return null;
            },
            hintText: 'car brand',
            inputType: TextInputType.text),
      ),
      actions: [
        Expanded(
          child: PrimaryButton(
              buttonColor: Colors.white,
              borderColor: AppColors.greyColor,
              text: 'Decline',
              btnTxtStyle: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () {}),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: PrimaryButton(
              buttonColor: AppColors.primaryColor,
              text: 'Confirm',
              btnTxtStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }*/

 /* Widget _showDialogBioForm(BuildContext context, String title) {
    return RichDialogBox(
      title: title,
      form: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: EditField(
            initVal: _controller.user.miniBio!,
            onSaved: (s) => _controller.user.miniBio = s,
            maxLines: 3,
            focusNode: _controller.bioFocusNode,
            txtcontroller: _controller.bioController,
            validator: (va) {
              return null;
            },
            hintText: _controller.user.miniBio!,
            inputType: TextInputType.multiline),
      ),
      actions: [
        Expanded(
          child: PrimaryButton(
              buttonColor: Colors.white,
              borderColor: AppColors.greyColor,
              text: 'Decline',
              btnTxtStyle: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: PrimaryButton(
              buttonColor: AppColors.primaryColor,
              text: 'Confirm',
              btnTxtStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: AppDimens.h2Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
              onPressed: () async {
                await _controller.addMinioBio(context);
                // ignore: use_build_context_synchronously

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              }),
        ),
      ],
    );
  }*/
  Widget _showConfirmDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: RichDialogBox(
          title: 'You Confirm to Logout ',
          content: const SizedBox(
            height: 52,
          ),
          actions: [
            Expanded(
              child: PrimaryButton(
                  buttonColor: Colors.white,
                  borderColor: AppColors.greyColor,
                  text: 'Decline',
                  btnTxtStyle: const TextStyle(
                      color: AppColors.greyColor,
                      fontSize: AppDimens.h2Size,
                      fontFamily: AppFonts.robotoRegular,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppDimens.letterSpace),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: PrimaryButton(
                  buttonColor: AppColors.primaryColor,
                  text: 'Confirm',
                  btnTxtStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: AppDimens.h2Size,
                      fontFamily: AppFonts.robotoRegular,
                      fontWeight: FontWeight.w400,
                      letterSpacing: AppDimens.letterSpace),
                  onPressed: () {}),
            ),
          ]),
    );
  }
}
