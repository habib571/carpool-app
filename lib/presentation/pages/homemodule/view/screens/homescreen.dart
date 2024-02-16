import 'package:carpooling/presentation/pages/homemodule/view/screens/coversation_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/booking_sreen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/home_screen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/rid_from_screen.dart';
import 'package:carpooling/presentation/pages/shareridemodule/view/screens/share_ride_screen.dart';
import 'package:carpooling/presentation/pages/homemodule/view/widgets/nav_icon.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../profilmodule/view/screens/myprofil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      padding: const NavBarPadding.symmetric(vertical: 20.0),
      navBarHeight: AppUtility().contentWidth(context) * .22,
      items: _navBarsItems(),
      screens: [ 
        SearchRideScreen() ,
       const MessagesScreen(),
        RideFormScreen() ,
       ProfilMode()
      ],
      backgroundColor: AppColors.accentColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
        colorBehindNavBar: AppColors.cBackgroundColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const NavIcon(icon: Icons.search, color: AppColors.primaryColor),
        inactiveIcon: const NavIcon(icon: Icons.search, color: Colors.grey),
        title: 'Search',
      ),
      PersistentBottomNavBarItem(
          icon: const NavIcon(
              icon: Icons.mark_unread_chat_alt_sharp,
              color: AppColors.primaryColor),
          inactiveIcon: const NavIcon(
              icon: Icons.mark_unread_chat_alt_sharp, color: Colors.grey),
          title: 'Messages'),
      PersistentBottomNavBarItem(
          icon: const NavIcon(
              icon: Icons.add_circle_outline_outlined,
              color: AppColors.primaryColor),
          inactiveIcon: const NavIcon(
              icon: Icons.add_circle_outline_outlined, color: Colors.grey),
          title: 'Publish'),
      PersistentBottomNavBarItem(
          icon:const NavIcon(icon: Icons.person, color: AppColors.primaryColor),
          inactiveIcon: const NavIcon(icon: Icons.person, color: Colors.grey),
          title: ' Profil'),
    ];
  }
}
