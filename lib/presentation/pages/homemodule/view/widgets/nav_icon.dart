import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key, 
    required this.icon, 
    required this.color,


    });
 final IconData icon ; 
 final Color color ;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon , 
      color: color,
      size: 24,
    );
  }
}