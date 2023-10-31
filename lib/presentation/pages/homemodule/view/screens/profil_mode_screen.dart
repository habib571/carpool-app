import 'package:carpooling/presentation/pages/homemodule/view/widgets/Info_widget.dart';
import 'package:carpooling/presentation/pages/homemodule/view/widgets/ridesharer_button.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_dimens.dart';
import 'package:carpooling/presentation/utils/app_fonts.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfilMode extends StatelessWidget {
  const ProfilMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          _showInformation(),
          const SizedBox(
            height: 10,
          ),
          _showRideDetails() ,
          _showDivider(),
          const SizedBox(
            height: 10,
          ),
          _verifyEmailSection(),
          const SizedBox(
            height: 10,
          ),
          _showDivider(),
          const SizedBox(
            height: 10,
          ),
          _showMiniBio()
        ],
      ),
    );
  }

  Widget _showImage() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/person_avatar.png'),
      backgroundColor: Colors.white,
      radius: 65,
    );
  }

  Widget _ratingSection() {
    return RatingBar.builder(
      itemSize: 15,
      initialRating: 3,
      minRating: 1,
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
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/icons/add.png'),
          height: 22,
          width: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Confirm Your mail adress',
          style: Styles().h2TextStyleRoboto(AppColors.greyColor),
        )
      ],
    );
  }

  Widget _showInformation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const  SizedBox(width: 10,) ,
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _showImage(),
              const SizedBox(height: 8),
              _ratingSection()
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed habib Rouatbi',
                style: TextStyle(
                    color: AppColors.blackcolor,
                    fontSize: AppDimens.titleSize,
                    fontFamily: AppFonts.poppinsRegular,
                    height: 1.1),
                //overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 7,
              ),
              InfoWidget(
                  imageUrl: 'assets/icons/mail.png',
                  title: 'habib.rouatbi123@gmail.com'),
              InfoWidget(
                  imageUrl: 'assets/icons/phone.png', title: '29 923 303'),
              Row(
                children: [
                  InfoWidget(
                      imageUrl: 'assets/icons/gender.png', title: 'Male'),
                  SizedBox(
                    width: 11,
                  ),
                  InfoWidget(
                      imageUrl: 'assets/icons/age.png', title: '29 Years old'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _showMiniBio() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
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
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage('assets/icons/edit.png'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
            maxLines: 3,
            text: TextSpan(
                text:
                    'Lorem ipsum dolor sit amet consectetur. Tortor integer imperdiet mauris nulla facilisis tincidunt neque. Congue pellentesque purus aenean eget.',
                style: Styles().pTextStyle(AppColors.blackcolor)))
      ],
    );
  }

  Widget _rideSharerButton() {
    return RideSharerbutton(
      onPressed: () {},
      buttonColor: Colors.white,
      text: 'Become a Ridesharer',
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
        ) , 
        SizedBox(width: 20) ,  
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
              '4 Incompleted' ,
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: AppDimens.h4Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
       
          ],
        ) , 



      ],
    );
  }
}
