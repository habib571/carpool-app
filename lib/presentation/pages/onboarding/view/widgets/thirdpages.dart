
import 'package:flutter/widgets.dart';
import '../../../../component/intro_dots.dart';
import '../../../../utils/app_colors.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  IntroDots(
      image: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Image.asset('assets/images/track_ride_image.png'),
              Positioned(
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Image.asset('assets/images/man.png')
                  )
              )
            ],
          )
      ),
      title: 'Track Your Ride' ,
      content: 'Know your driver in advance and be\nable to view current location',
      bgColor: AppColors.cLightBlueColor,
      headingColor: AppColors.cPrimaryColor,
    );
  }
}