import 'package:carpooling/domain/models/ride.dart';
import 'package:carpooling/presentation/component/components.dart';
import 'package:carpooling/presentation/pages/homemodule/view/screens/homescreen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/screen/ride_details_screen.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/view/widget/search_item.dart';
import 'package:carpooling/presentation/pages/search_ride-screen.dart/viewmodel/searchride_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});
  final SearchRideController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cScaffoldColor,
        body: _showBody(context),
      ),
    );
  }

  Widget _showBody(BuildContext ctx) {
    return Column(
      children: [_showTtile(ctx), _buildListBottomSheet(ctx)],
    );
  }

  Widget _showTtile(BuildContext context) {
    return SizedBox(
      height: AppUtility().contentHeight(context) * 0.1,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      Get.back() ;
                    },
                    child: SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                Text(
                  'Search Result',
                  style: Styles().h1TitleStyle(AppColors.primaryColor),
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }

  Widget _showBookingOverlay(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.cAccentDarkColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0),
            ),
          ),
          child: _buildListBottomSheet(ctx),
        ),
      ],
    );
  }

  Widget _buildListBottomSheet(BuildContext context) {
    return StreamBuilder<Ride>(
        stream: _controller.outputRidesStream,
        builder: (context, snapshot) {
          return SizedBox(
              height: AppUtility().contentHeight(context) * 0.7,
              child: _controller.ridelist.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _controller.ridelist.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: SearchListItem(
                            imageUrl:
                                'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                            name: AppStrings.riderName,
                            onPressed: () {
                              Get.to(() => const RideDetailsSceen());
                            },
                            description: AppStrings.hatchBack,
                            fromLocation: _controller.ridelist[index].from! ,
                            toLocation: _controller.ridelist[index].to!,
                            timer: _controller.ridelist[index].time!,
                            seats:
                                _controller.ridelist[index].seats!.toString(),
                            money: _controller.ridelist[index].price!,
                          ),
                        );
                      })
                  : const Center(child: Text('No Rides Found')));
        });
  }
}
