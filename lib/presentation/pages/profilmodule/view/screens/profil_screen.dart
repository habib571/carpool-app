/*import 'package:carpooling/presentation/pages/profilmodule/view/screens/edit_mode_screen.dart';
import 'package:carpooling/presentation/pages/profilmodule/view/screens/profil_mode_screen.dart';

import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.cScaffoldColor, body: _showBody()));
  }

  Widget _buildTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TabBar(
          unselectedLabelStyle:
              Styles().h3TextStyle(AppColors.textSecondaryColor),
          labelStyle: Styles().h2TextStyle(AppColors.textPrimaryColor),
          labelColor: AppColors.textPrimaryColor,
          dividerColor: Colors.white,
          indicatorColor: AppColors.primaryColor,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Profil Mode',
            ),
            Tab(
              text: 'Edit Mode',
            )
          ]),
    );
  }

  Widget _showTabView() {
    return TabBarView(
        controller: _tabController,
        children: <Widget>[ ProfilMode(), EditModeScreen()]);
  }

  Widget _showBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35) ,
            child: Text(
                  'Profil',
                    style: Styles().h1TitleStyle(AppColors.primaryColor),
                  ),
          ),
          Expanded(
            child: Column(
              children: [_buildTab(), Expanded(child: _showTabView())],
            ),
          ),
        ],
      ),
    );
  }
}
*/