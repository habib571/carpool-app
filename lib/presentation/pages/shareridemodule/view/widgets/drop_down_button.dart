import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../viewmodel/ride_share_viewmodel.dart';

class DropDownButt extends StatelessWidget {
  DropDownButt({super.key, required this.label});
  final String label;
  final RideSharingController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles().h2TextStyleRoboto(AppColors.blackcolor),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField(
           
            decoration: const InputDecoration( 
            
              filled: true,
              fillColor: AppColors.accentColor,
            ),
            value: _controller.dropValue.value,
            onChanged: (int? newValue) {
              _controller.dropValue(newValue);
            },
            items: _controller.itemlist.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
