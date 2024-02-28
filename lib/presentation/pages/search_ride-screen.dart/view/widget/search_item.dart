import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../component/dotted_line.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimens.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_utility.dart';
import '../../../../utils/styles.dart';

class SearchListItem extends StatefulWidget {
  const SearchListItem({Key? key, 
    this.radius = 25.0,
    this.name = '',
    this.description = '',
    this.fromLocation = '',
    this.toLocation = '',
    this.timer = '5',
    this.seats = '5',
    this.money =  '5',
    required this.imageUrl,
    required this.onPressed
  }) : super(key: key);

  final double radius;
  final String name;
  final String description;
  final String timer;
  final String seats;
  final String money;
  final String fromLocation;
  final String toLocation;
  final String imageUrl;
  final Function onPressed;

  @override
  State<SearchListItem> createState() => _SearchListItemState();
}

class _SearchListItemState extends State<SearchListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 20, left: 10),
      height: AppUtility().contentWidth(context) *.6,
      //width: AppUtility().contentWidth(context) *.8,
      decoration: BoxDecoration(
        color: AppColors.cPrimaryColor,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
            child: InkWell(
              onTap: () => widget.onPressed(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: CircleAvatar(
                      radius: widget.radius,
                      backgroundColor: AppColors.cAccentColor,
                      // backgroundImage: widget.image,
                      child: CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                Colors.white60,
                                BlendMode.overlay,
                              ),
                            ),
                          ),
                        ),
                      //  placeholder: (context, url) =>const LoadingWidget(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:5.0),
                        child: Text(
                          widget.name,
                          style: Styles().mediumTextStyle(
                            AppColors.cTextColor
                          ),
                        ),
                      ),
                      Text(
                        widget.description,
                        style: Styles().subHeaderStyle(
                            AppColors.cBorderColor,
                            AppDimens.minSmallTextSize,
                            AppFonts.robotoRegular
                        ),
                      ),
                    ],
                  ),
                 const Spacer(),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: EdgeInsets.zero,
                    itemBuilder: (context, _) => const Icon(
                     Icons.star,
                      color: AppColors.cRatingColor,
                    ),
                    onRatingUpdate: (rating) {
                      // ignore: avoid_print
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
              child: Row(
                children: [
               const  DottedLine(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Text(
                          widget.fromLocation,
                          style:const TextStyle(
                            fontFamily: AppFonts.robotoRegular,
                            fontSize: AppDimens.minSmallTextSize,
                            color: AppColors.cBackgroundColor,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          widget.fromLocation,
                          style: const TextStyle(
                            fontFamily: AppFonts.robotoRegular,
                            fontSize: AppDimens.minSmallTextSize,
                            color: AppColors.cBackgroundColor,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
             child: Container(
               height: AppUtility().contentWidth(context)*.12,
               decoration:const BoxDecoration(
                   color:  AppColors.accentColor,
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(5.0),
                     bottomRight: Radius.circular(5.0),
                   )
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  const Spacer(),
                   SvgPicture.asset( 
                    'assets/icons/clock.svg' , 
                    ),
                   Padding(
                     padding: const EdgeInsets.only(left:5.0),
                     child: Text(
                       widget.timer,
                       style: Styles().subHeaderStyle(
                           AppColors.cBackgroundColor,
                           AppDimens.minSmallTextSize,
                           AppFonts.robotoRegular
                       ),
                     ),
                   ),
                  const Spacer(),
                   SvgPicture.asset('assets/icons/seat.svg'),
                   Padding(
                     padding: const EdgeInsets.only(left:5.0),
                     child: Text(
                       widget.seats,
                       style: Styles().subHeaderStyle(
                           AppColors.cBackgroundColor,
                           AppDimens.minSmallTextSize,
                           AppFonts.robotoRegular
                       ),
                     ),
                   ),
                  const Spacer(),
                   SvgPicture.asset('assets/icons/cash_icon.svg'),
                   Padding(
                     padding: const EdgeInsets.only(left:5.0),
                     child: Text(
                       widget.money,
                       style: Styles().subHeaderStyle(
                           AppColors.cBackgroundColor,
                           AppDimens.minSmallTextSize,
                           AppFonts.robotoRegular
                       ),
                     ),
                   ),
                  const Spacer(),
                 ],
               ),
             )
          )
        ],
      ),
    );
  }
}
