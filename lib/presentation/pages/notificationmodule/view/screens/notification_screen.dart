import 'package:carpooling/domain/models/notification.dart';
import 'package:carpooling/presentation/pages/notificationmodule/view/widgets/notification_widget.dart';
import 'package:carpooling/presentation/pages/notificationmodule/viewmodel/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../component/application_bar.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
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
    return GetX<NotificationController>(builder: (_) {
      if (_.notificationsList.isNotEmpty) {
        return ListView.builder(
            itemCount: _.notificationsList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 25.0),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return NotificationWidget(
                isButtonLoading: _.isButtonLoading.value,
                acceptPassenger: () {
                  _.acceptPassenger(
                      _.notificationsList[index].rideId!,
                      _.notificationsList[index].fromId!,
                      _.notificationsList[index].toId!);
                },
                rejectPassenger: () {},
                imageUrl: _.notificationsList[index].senderPhotoUrl!,
                senderName: _.notificationsList[index].senderName!,
                description: _.notificationsList[index].description!,
                isRequest: true,
              );
            });
      }

      return const SizedBox();
    });
  }
}
