import 'package:flutter/material.dart';

class AppUtility {
  AppUtility();

  // Global Functions
  double contentHeight(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height - MediaQuery.of(context).padding.top -MediaQuery.of(context).padding.bottom;
    return mediaHeight;
  }

  double contentWidth(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return mediaHeight;
  }

}
