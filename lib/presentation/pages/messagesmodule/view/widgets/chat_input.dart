import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:carpooling/presentation/utils/app_utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInput extends StatelessWidget {
  const ChatInput(
      {super.key, required this.messageInput, required this.sendMessage});
  final TextEditingController messageInput;
  final Function() sendMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppUtility().contentHeight(context) * .01,
          horizontal: AppUtility().contentWidth(context) * .025),
      child: Row(
        children: [
          //input field & buttons
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  //emoji button
                  IconButton(
                      onPressed: () {
                        /*  FocusScope.of(context).unfocus();
                        setState(() => _showEmoji = !_showEmoji);*/
                      },
                      icon: const Icon(Icons.emoji_emotions,
                          color: AppColors.primaryColor, size: 25)),

                  Expanded(
                      child: TextField(
                    controller: messageInput,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                   
                    decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: AppColors.greyColor),
                        border: InputBorder.none),
                  )),

                  //pick image from gallery button
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Picking multiple images
                        /*  final List<XFile> images =
                            await picker.pickMultiImage(imageQuality: 70);

                        // uploading & sending image one by one
                        for (var i in images) {
                          log('Image Path: ${i.path}');
                          setState(() => _isUploading = true);
                          await ctrl.sendChatImage(widget.room ,  File(i.path));
                          setState(() => _isUploading = false);
                        }*/
                      },
                      icon: const Icon(Icons.image,
                          color: AppColors.primaryColor, size: 26)),

                  //take image from camera button
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 70);
                        /*     if (image != null) {
                          log('Image Path: ${image.path}');
                          setState(() => _isUploading = true);

                          await ctrl.sendChatImage( widget.room ,
                               File(image.path));
                          setState(() => _isUploading = false);
                        }*/
                      },
                      icon: const Icon(Icons.camera_alt_rounded,
                          color: AppColors.primaryColor, size: 26)),

                  //adding some space
                  SizedBox(width: AppUtility().contentWidth(context) * .02),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {
              if (messageInput.text.isNotEmpty) {
                sendMessage();
              }
            },
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: AppColors.primaryColor,
            child: const Icon(Icons.send, color: Colors.white, size: 28),
          )
        ],
      ),
    );
  }
}
