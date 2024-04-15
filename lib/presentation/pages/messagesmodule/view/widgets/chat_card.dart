import 'package:cached_network_image/cached_network_image.dart';
import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({
    super.key,
  });

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  //last message info (if null --> no message)

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppUtility().contentWidth(context)  *.04, vertical: 4),
     color: AppColors.accentColor ,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
          onTap: () {
            //for navigating to chat screen
          },
          child: ListTile( 
              //user profile picture
              leading: SizedBox( 
                height: 60, 
                width: 60,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
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
              title: const Text('Yassine lazrek'),

              //last message
              subtitle: const Text('hey, habib', maxLines: 1),

              //last message time
              trailing:
                  //show for unread message
                  Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
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
