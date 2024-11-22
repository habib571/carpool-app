import 'package:cached_network_image/cached_network_image.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class ParticipantWidget extends StatefulWidget {
  const ParticipantWidget({super.key, required this.imageUrl, required this.radius, required this.name});
  final String imageUrl; 
  final double radius ; 
  final String name ;

  @override
  State<ParticipantWidget> createState() => _ParticipantWidgetState();
}

class _ParticipantWidgetState extends State<ParticipantWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
        CircleAvatar( 
           radius: widget.radius,
                        backgroundColor: AppColors.cAccentColor,
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
        const SizedBox(
          width: 15,
        ) ,
        Text(
            widget.name,
           style: Styles().h1TitleStyle(AppColors.blackcolor),
        )
      ]),
    );
  }
}
