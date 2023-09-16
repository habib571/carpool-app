
import 'package:flutter/widgets.dart';
import '../../../../component/intro_dots.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroDots(
      image: Container(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              Image.asset('assets/images/split_cost.png'),
              Positioned(
                  child: Container(
                      padding: AppDimens.intoSecondPadding,
                      child: Image.asset('assets/images/young_people.png')
                  )
              ),
            ],
          )
      ),
      title: 'Split cost , Share fun',
      content: 'Save your cost by splitting seats and\nhave fun with co-ryders  ',
      bgColor: AppColors.cLightPinkColor,
      headingColor: AppColors.cMediumVioletColor,
    );
  }
}