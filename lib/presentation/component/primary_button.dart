import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimens.dart';
import '../utils/app_fonts.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key, 
    this.buttonColor = AppColors.cAccentColor,
    required this.onPressed,
    this.text = '',
    this.btnTxtStyle =  const TextStyle(
        color: AppColors.cPrimaryColor,
        fontSize: AppDimens.h2Size,
        fontFamily: AppFonts.robotoRegular,
        fontWeight: FontWeight.w400,
        letterSpacing: AppDimens.letterSpace
    ), this.splashColor = AppColors.cAccentColor,
  });

  final Color buttonColor;
  final Color splashColor;
  final String text;
  final TextStyle btnTxtStyle;
  final Function() onPressed;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: widget.splashColor.withOpacity(.3),
                  blurRadius: 15,
                    offset: const Offset(1.0, 8.0)
                ),
              ],
            ),
            child: MaterialButton(
              color: widget.buttonColor,
              splashColor: widget.splashColor,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              onPressed: widget.onPressed,
              child: Text(
                widget.text,
                style: widget.btnTxtStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
