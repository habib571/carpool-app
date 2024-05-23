import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/domain/models/ride.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/screen/booking_sreen.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/screen/ride_details_screen.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/widget/search_item.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/searchride_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../app/contants.dart';
import '../../../../../data/datasource/remote/rides_remote_datasource.dart';
import '../../../../../data/repository/rides_repo_impl.dart';
import '../../../../../domain/usecases/auth_usecase.dart/search_ride_use_case.dart';
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
  return GetBuilder<SearchRideController>(
    init: SearchRideController(SearchRideUseCase(RidesRepositoryImp(NetworkInfoImpl(InternetConnectionChecker()), RideRemoteDatsourceImp()))),
    builder: (_) {
      return StreamBuilder<List<Ride>>(
        stream: _controller.rideStream.stream,
        builder: (context, snapshot) {  
           switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));

          //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done: 
          
         if(_.ridelist.isNotEmpty) {
            return SizedBox(
              height: AppUtility().contentHeight(context) * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _.ridelist.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: SearchListItem(
                      imageUrl: '${Constants.baseUrl}/storage/${_.ridelist[index].driverPicture!}' ,
                      name: _.ridelist[index].name!,
                      onPressed: () {
                        Get.to(() =>  RideDetailsSceen(), arguments: _.ridelist[index]);
                      },
                      description: AppStrings.hatchBack,
                      fromLocation: _.ridelist[index].from!,
                      toLocation: _.ridelist[index].to!,
                      timer: _.ridelist[index].time!,
                      seats: _.ridelist[index].seats!.toString(),
                      money: _.ridelist[index].price!,
                    ),
                  );
                },
              ),
            );
          }
        }  
         return const SizedBox();
        
        },
      );
    },
  );
}
   /*Widget _showNotificationList() {
    return StreamBuilder(
      stream: _.getNotifications(),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));

          //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done:
            final data = snapshot.data?.docs;
            _.list =
                data?.map((e) => Notifi.fromJson(e.data())).toList() ?? [];
            print(_.list.length);

            if (_.list.isNotEmpty) {
              return ListView.builder(
                  itemCount: _.list.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25.0),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GetX<NotificationController>(
                      builder: (_) {
                        return NotificationWidget( 
                          isButtonLoading: _.isButtonLoading.value,
                          acceptPassenger: () { 
                            _.acceptPassenger(_.list[index].rideId! , _.list[index].fromId!, _.list[index].toId!) ;
                          },
                          rejectPassenger: () {},
                          imageUrl: _.list[index].senderPhotoUrl!,
                          senderName: _.list[index].senderName!,
                          description: _.list[index].description!,
                          isRequest: true,
                        );
                      }
                    );
                  });
            }

            return const SizedBox();
        }
      }),
    );
  }    */  

}
