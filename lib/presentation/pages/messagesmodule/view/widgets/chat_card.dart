import 'package:cached_network_image/cached_network_image.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/chat_user.dart';

class ChatUserCard extends StatelessWidget {
  const ChatUserCard({
    super.key, required this.chatuser, required this.ontap,
  });
 final ChatUser chatuser ; 
 final Function() ontap;
  //last message info (if null --> no message)
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppUtility().contentWidth(context)  *.04, vertical: 4),
     color: AppColors.cPrimaryColor,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
          onTap: () { 
            ontap() ;
           
          },
          child: ListTile( 
              //user profile picture
              leading: SizedBox( 
                height: 60, 
                width: 60,
                child: CachedNetworkImage(
                  imageUrl: chatuser.imageUrl! ,
  
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

              //user name
              title: Text(chatuser.name!),

              //last message
              subtitle:  Text(  chatuser.lastMessage!, maxLines: 1),

              //last message time
              trailing:
                  //show for unread message
                  Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration( 
                    color: chatuser.activeStatus! ?
                     Colors.greenAccent.shade400
                     :   AppColors.greyColor ,
                    borderRadius: BorderRadius.circular(10)),
              )
              /*:
                        //message sent time
                        Text( 
                          '15:00  ' ,
                          /*  MyDateUtil.getLastMessageTime(
                                context: context, time: _message!.sent),*/
                            style: const TextStyle(color: Colors.black54),
                          ),*/
              )),
    );
  }
}
