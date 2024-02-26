import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key, required this.icon});

  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        shape: BoxShape.circle , 
         border: Border.all(color:AppColors.accentColor )        
      ), 
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image(
          height: 25,
          width: 25,
          image: AssetImage(icon)),
      ),
          ) ;
  }
}
