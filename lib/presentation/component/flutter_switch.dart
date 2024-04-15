import 'package:carpooling/presentation/pages/profilmodule/viewmodel/profil_viewmodel.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterSwitch extends StatelessWidget {
 FlutterSwitch({super.key, 
    this.onClick,
    this.backGroundColor = AppColors.cTextGreyColor,
    this.switchColor = AppColors.cGreenColor,
    this.switchOffColor = AppColors.cTextGreyColor,
    this.onTap = false,
  });
  final Function()? onClick;
  final Color backGroundColor;
  final Color switchColor;
  final Color switchOffColor;
  final bool onTap;

  final ProfilController _controller = Get.find() ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(11.0),
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: backGroundColor
            ),
          ),
          _controller.onClick.value ? Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) :
          onTap ? Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) :
          Positioned(
            left: 0,
            child: Icon(
              Icons.circle,
              color: switchOffColor,
            ),
          )
        ],
      ),
    );
  }
}
