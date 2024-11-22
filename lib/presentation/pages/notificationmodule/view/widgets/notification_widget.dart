import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../app/contants.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/styles.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,
      required this.isRequest,
      required this.imageUrl,
      required this.senderName,
      required this.description,
      required this.acceptPassenger,
      required this.rejectPassenger ,  
       this.isButtonLoading = false
       });
  final bool isRequest;
  final String imageUrl;
  final String senderName;
  final String description;
  final Function() acceptPassenger;
  final Function() rejectPassenger;
  final bool isButtonLoading ;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.cPrimaryColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showImage(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _showContent(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _showTime(),
                        const Spacer(),

                        //_showButton()
                      ],
                    ),
                    _showButtons()
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _showImage() {
    return CircleAvatar(
      radius: 30.0,
      child: CachedNetworkImage(
        imageUrl: '${Constants.baseUrl}/storage/$imageUrl',
        httpHeaders: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.white60,
                BlendMode.overlay,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _showContent() {
    return RichText(
      text: TextSpan(
          text: senderName,
          style: const TextStyle(
              color: AppColors.cBackgroundDarkColor,
              fontSize: AppDimens.subTextSize,
              fontFamily: AppFonts.poppinsRegular,
              height: 1.3),
          children: [
            TextSpan(
              text: description,
              style: const TextStyle(
                  color: AppColors.cGrayColor,
                  fontSize: AppDimens.subTextSize,
                  fontFamily: AppFonts.robotoRegular,
                  height: 1.3),
            ),
          ]),
    );
  }

  Widget _showTime() {
    return Text(
      AppStrings.timeAgo,
      style: Styles().subHeaderStyle(AppColors.cBorderColor,
          AppDimens.subTextSize, AppFonts.robotoRegular),
    );
  }

  Widget _showButtons() {
    return Row(
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          elevation: 0,
          height: 35,
          color: AppColors.primaryColor,
          child:   
        !isButtonLoading?   Text(
            'Accept',
            style: Styles().subHeaderStyle(
              AppColors.cPrimaryColor,
              AppDimens.minSmallTextSize,
              AppFonts.robotoRegular,
            ),
          ) 
           : const Padding(
             padding: EdgeInsets.symmetric(vertical: 6),
             child: CircularProgressIndicator(color: AppColors.cPrimaryColor,),
           ),

           
          onPressed: () {
            acceptPassenger();
          },
        ),
        const SizedBox(width: 5),
        MaterialButton(
          padding: EdgeInsets.zero,
          elevation: 0,
          height: 35,
          color: AppColors.accentColor,
          child: Text(
            'Reject',
            style: Styles().subHeaderStyle(
              AppColors.primaryColor,
              AppDimens.minSmallTextSize,
              AppFonts.robotoRegular,
            ),
          ),
          onPressed: () {
            rejectPassenger();
          },
        ),
      ],
    );
  }
}
