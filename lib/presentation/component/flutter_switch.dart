import 'package:flutter/material.dart';


import '../utils/app_colors.dart';

class FlutterSwitch extends StatelessWidget {
  const FlutterSwitch({super.key, 
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
          Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) ,
        Positioned(
            right: 0,
            child: Icon(
              Icons.circle,
              color: switchColor,
            ),
          ) ,
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
