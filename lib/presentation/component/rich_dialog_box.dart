import 'package:carpooling/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_dimens.dart';
import '../utils/app_fonts.dart';

class RichDialogBox extends StatelessWidget {
  const RichDialogBox({super.key, 
    required this.title,
    this.titleStyle = const TextStyle(
        color: AppColors.primaryColor,
        fontSize: AppDimens.h2Size,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w500,
        letterSpacing: AppDimens.letterSpace
    ),
    this.titlePadding = const EdgeInsets.all(0),
    this.form,
    this.content,
    this.actions,
    this.borderRadius = 20.0
  });

  final String title;
  final TextStyle titleStyle;
  final Widget? form;
  final Widget? content;
  final EdgeInsetsGeometry titlePadding;
  final List<Widget>? actions;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {

    final Widget dialogChild =
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: titlePadding,
                          child: Text(
                            title,
                            
                            style: titleStyle,
                          ),
                        ),
                        form != null ? form! : const SizedBox(height: 0,),
                        content != null ? content! : const SizedBox(height: 0,),
                      ],
                    ),
                    (actions != null) ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  actions!
                    ) : const SizedBox(height: 0,),
                  ],
                ),
              ),
            ),
          /*  Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/icons/info_icon.png',
                width: 70,
                height: 70,
              ),
            ),*/
          ],
        ),
      ],
    );


    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogChild,
    );
  }
}
