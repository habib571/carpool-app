
import 'package:carpooling/data/datasource/remote/userinfo_remote_datasource.dart';
import 'package:carpooling/data/network/network_info.dart';
import 'package:carpooling/data/repository/user_info_repo_impl.dart';
import 'package:carpooling/domain/usecases/auth_usecase.dart/get_user_data_use_case.dart';
import 'package:carpooling/presentation/pages/searchRideModule/view/widget/contact_icon.dart';
import 'package:carpooling/presentation/pages/searchRideModule/viewmodel/driver_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../app/contants.dart';
import '../../../../common/state_render_imp.dart';
import '../../../../component/application_bar.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';

class DriverProfileScreen extends StatelessWidget {
 DriverProfileScreen({super.key});
 final DrivertProfileController _controller = Get.put(DrivertProfileController(GetUserDataUseCase(UserInfoRepositpryImp(UserInfoRemoteDataSourceImp(), NetworkInfoImpl(InternetConnectionChecker()))))) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cScaffoldColor,
      appBar: ApplicationBar(
        isProfile: false,
        title: 'Profile',
        backgroundColor: AppColors.cScaffoldColor,
        isLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: StreamBuilder<FlowState>(
            stream: _controller.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, _showBody(context),
                      () {
                    _controller.start();
                  }) ??
                  _showBody(context);
            }));
  }
    
  

  Widget _showBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            _showImage(context),
            const SizedBox(
              height: 10,
            ),
            _showName(),
            const SizedBox(
              height: 10,
            ),
            _ratingSection(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            _showContactIcons(),

            const SizedBox(
              height: 32,
            ),
            _showRideDetails(),

            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            /*  _controller.user?.miniBio != ''
                ? _showMiniBio(context)
                : _showMiniBioButton(context),
            const SizedBox(height: 10),
            _showDivider(),
            _buildListItems(context)*/
          ]),
        )
      ],
    );
  }

  Widget _showImage(BuildContext context) {
    return ClipRRect(
        child: CircleAvatar(
      radius: AppUtility().contentWidth(context) * .17,
      backgroundImage: NetworkImage(
          '${Constants.baseUrl}/storage/${_controller.user?.picture}',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }),
    ));
  }
  Widget _ratingSection() {
    return RatingBar.builder(
      itemSize: 22,
      initialRating: 3,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  }

  Widget _showName() {
    return  Text(
       '${_controller.user?.lastName} ${_controller.user?.firstName} ',
      style: const TextStyle(
          color: AppColors.blackcolor,
          fontSize: AppDimens.titleSize,
          fontFamily: AppFonts.poppinsRegular,
          height: 1.1),
      //overflow: TextOverflow.clip,
    );
  }

  Widget _showRideDetails() {
    return Row(  
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/blue_car_icon.svg'),
            const Text(
              '10 Completed',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimens.h4Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            SvgPicture.asset('assets/icons/red_car_icon.svg'),
            /*  Image(
               height: 20, 
              width: 20,
              image: AssetImage('assets/icons/rejected.png')),*/
            const Text(
              '4 Incompleted',
              style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: AppDimens.h4Size,
                  fontFamily: AppFonts.robotoRegular,
                  fontWeight: FontWeight.w400,
                  letterSpacing: AppDimens.letterSpace),
            ),
          ],
        ),
      ],
    );
  }

  Widget _showContactIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(child: ContactIcon(icon: 'assets/icons/phone.png')),
        SizedBox(
          width: 16,
        ),
        InkWell(child: ContactIcon(icon: 'assets/icons/message.png')),
      ],
    );
  }
}