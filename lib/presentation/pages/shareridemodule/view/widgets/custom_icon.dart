import 'package:carpooling/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key, required this.imageurl
    
    });
final String imageurl ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor ,
       borderRadius:  BorderRadius.circular(4)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5) ,
        child: Image(
          image:AssetImage(imageurl) 
          ),
        ),
    ) ;
  }
}