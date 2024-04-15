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
  final NotificationController _controller = Get.find();
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
      stream: _controller.getNotifications(),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));

          //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done:
            final data = snapshot.data?.docs;
            _controller.list =
                data?.map((e) => Notifi.fromJson(e.data())).toList() ?? []; 
                print(_controller.list.length) ;

            if (_controller.list.isNotEmpty) {
              return ListView.builder(
                  itemCount:  _controller.list.length ,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25.0),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return  NotificationWidget(
                      isRequest: true , 
                      imageUrl:  _controller.list[index].senderPhotoUrl! , 
                      senderName: _controller.list[index].senderName!, 
                      description: _controller.list[index].description!,

                      );
                  });
            }

            return const SizedBox();
        }
      }),
    );
  }
}
