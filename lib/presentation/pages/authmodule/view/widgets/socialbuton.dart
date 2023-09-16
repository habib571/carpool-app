import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    Key? key,
    required this.fbOnPressed,
    required this.gOnPressed,
    required this.tOnPressed
  }) : super(key: key);

  final Function() fbOnPressed;
  final Function() gOnPressed;
  final Function() tOnPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () => fbOnPressed(),
          textColor: AppColors.cPrimaryColor,
          padding:const EdgeInsets.all(2.0),
          shape: const CircleBorder(),
          child: Image.asset(
              'assets/icons/fb_icon.png',
            width: 45,
          ),
        ),
        MaterialButton(
          onPressed: () => gOnPressed(),
          textColor: AppColors.cPrimaryColor,
          padding:const EdgeInsets.all(2.0),
          shape:const CircleBorder(),
          child: Image.asset(
            'assets/icons/google_icon.png',
            width: 45,
          ),
        ),
        MaterialButton(
          onPressed: () => tOnPressed(),
          textColor: AppColors.cPrimaryColor,
          padding:const EdgeInsets.all(2.0),
          shape:const CircleBorder(),
          child: Image.asset(
            'assets/icons/twiter_icon.png',
            width: 45,
          ),
        )
      ],
    );
  }
}


