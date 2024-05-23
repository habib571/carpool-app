import 'package:carpooling/domain/models/notification.dart';
import 'package:carpooling/presentation/pages/notificationmodule/view/widgets/notification_widget.dart';
import 'package:carpooling/presentation/pages/notificationmodule/viewmodel/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/application_bar.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final NotificationController _ = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        isProfile: false,
        title: 'Notifications',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: _showBody(),
    );
  }

  Widget _showBody() {
    return Padding(
      padding: AppDimens.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                _showNotificationList(),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showNotificationList() {
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
  }
}
