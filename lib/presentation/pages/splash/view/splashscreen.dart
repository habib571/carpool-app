
import 'package:carpooling/presentation/pages/onboarding/view/onbardingscreen.dart';
import 'package:carpooling/presentation/pages/splash/viewmodel/splashviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  
final SplashControllerImp _controller = Get.put(SplashControllerImp()) ;
@override
  void initState() {
    _initAnimationController();
    _showLogoAndNavigate();
    super.initState();
  }

  void _initAnimationController() {
    _controller.splashAnimationController = AnimationController(
      vsync: this,
      duration: _controller.splashTransitionDuration,
    );
  }

  void _showLogoAndNavigate() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => _controller.isSplashExpanded = false.obs  ,))
        .then(
          (value) => Future.delayed(_controller.splashTransitionDuration * 2).then(
            (value) => _controller.splashAnimationController
                .forward()
                .then((value) => { Get.to(()=>OnboardinScreen())}),
          ),
        ); 
        print(_controller.isSplashExpanded) ;
  }


  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: _showMaterialBody(),
    );
  }

  Widget _showMaterialBody() {
    return Material(
      child: Container(
        color: AppColors.cAccentDarkColor,
        child: Stack(
          children: [
            _showTopVector(),
            _showBottomVector(),
            _showCenterSection(),
          ],
        ),
      ),
    );
  }

  Widget _showTopVector() {
    return Positioned(
        top: 0, child: Image.asset(ImagesAss.splashTopVector));
  }

  Widget _showBottomVector() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Image.asset(ImagesAss.splashbottomVector));
  }

  Widget _showCenterSection() {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showAnimatedCrossFade(),
          _showSplashLogo(),
        ],
      ),
    );
  }

  Widget _showAnimatedCrossFade(){
    return AnimatedCrossFade(
      firstCurve: Curves.fastOutSlowIn,
      crossFadeState: _controller.isSplashExpanded.value
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: _controller.splashTransitionDuration,
      firstChild:   const Text('R'),
      secondChild: RotatedBox(
        quarterTurns: -5,
        child: Text(
              'Ride Talk',
          style: Styles().titleStyle(),
        ),
      ),
      alignment: Alignment.centerLeft,
      sizeCurve: Curves.easeIn,
    );
  }

  Widget _showSplashLogo(){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: AnimatedDefaultTextStyle(
          duration: _controller.splashTransitionDuration,
          curve: Curves.fastOutSlowIn,
          style:   const TextStyle(),
          child: Image.asset(ImagesAss.logo)),
    );
  }

}
