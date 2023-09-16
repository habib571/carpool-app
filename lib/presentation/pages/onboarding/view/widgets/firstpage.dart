
import 'package:flutter/widgets.dart';
import '../../../../component/intro_dots.dart';
import '../../../../utils/app_dimens.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  IntroDots(
      image: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Image.asset('assets/images/neighbour_image.png'),
              Positioned(
                  child: Container(
                      padding: AppDimens.intoFirstPadding,
                      child: Image.asset('assets/images/taxi.png')
                  )
              ),
            ],
          )
      ),
      title: 'Carpool With neighbours',
      content: 'Find neighbours from your area\nand carpool with them',
    );
  }
}