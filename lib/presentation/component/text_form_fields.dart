import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimens.dart';
import '../utils/app_fonts.dart';


class TextFormFields extends StatefulWidget {
  const TextFormFields({super.key, 
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.textEditingController,
    this.contentPadding = const EdgeInsets.all(15.0),
    //this.initialValue = '',
    this.autoFocus = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.obscureText = false,
    this.textInputAction = TextInputAction.continueAction,
    this.label = '',
    this.labelStyle = const TextStyle(
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.smallTextSize,
      color: AppColors.greyColor,
    ),
    this.hintText = '',
    this.hintStyle = const TextStyle(
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.subTextSize,
      color: AppColors.greyColor,
    ),
    this.suffixStyle = const TextStyle(
      fontFamily: AppFonts.robotoRegular,
      fontSize: AppDimens.subTextSize,
      color: AppColors.cPrimaryColor,
    ),
    this.fieldStyle = const TextStyle(
        fontFamily: AppFonts.robotoRegular,
        fontSize: AppDimens.subTextSize,
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.normal
    ),
    this.errorStyle = const TextStyle(
        fontFamily: AppFonts.robotoRegular,
        fontSize: AppDimens.subTextSize,
        height: 1,
        fontWeight: FontWeight.normal
    ),
    this.borderColor = AppColors.primaryColor,
    this.errorBorderColor = AppColors.cGoogleDarkColor,
    this.focusColor = AppColors.cPrimaryColor,
    this.cursorColor = AppColors.greyColor,
    this.focusBorderColor = AppColors.primaryColor,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.isIcon = false,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.dense = false,
    this.icon,
    this.image,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onEditingComplete,
    this.onTap,
    this.obscuringCharacter = '•',
    this.filled = true,
    this.isBorder = true,
    this.fillColor = AppColors.accentColor,
    this.isPrefix = false,
    this.prefixText,
    this.suffixText = '',
    this.suffixIconConstraints,
    this.borderRadius = BorderRadius.zero,
    this.prefixTextStyle = const TextStyle(
        fontFamily: AppFonts.robotoRegular,
        fontSize: AppDimens.minTextSize,
        color: AppColors.cTextColor,
        fontWeight: FontWeight.normal
    ),
  });

  final TextAlign textAlign;
  final bool enabled;
  final TextEditingController? textEditingController;
  final EdgeInsets contentPadding;
  //
  //final String initialValue;
  final bool autoFocus;
  final int maxLines;
  final int minLines;
  final bool obscureText;
  final TextInputAction textInputAction;
  final String label;
  final String suffixText;
  final TextStyle labelStyle;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle suffixStyle;
  final TextStyle fieldStyle;
  final TextStyle errorStyle;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final bool isIcon;
  final bool isSuffixIcon;
  final bool isPrefixIcon;
  final bool dense;
  final Widget? icon;
  final Widget? image;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color borderColor;
  final Color errorBorderColor;
  final Color focusColor;
  final Color focusBorderColor;
  final Color cursorColor;
  final Function(String s)? onChanged;
  final String? Function(String? s)? validator;
  final Function(String? s)? onSaved;
  final Function(String s)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final String obscuringCharacter;
  final List<TextInputFormatter>? inputFormatter;
  final bool filled;
  final bool isBorder;
  final Color fillColor;
  final BoxConstraints? suffixIconConstraints;
  final bool isPrefix;
  final String? prefixText;
  final TextStyle prefixTextStyle;
  final BorderRadius borderRadius;

  @override
  State<StatefulWidget> createState() {
    return _TextFormFieldsState();
  }
}

class _TextFormFieldsState extends State<TextFormFields> {
final FocusNode focusPass = FocusNode();
  TextStyle? hintStyle;

  @override
  void initState() {
    super.initState();
    focusPass.addListener(onFocusChange);
  }

  void onFocusChange() {
    setState(() {
      hintStyle = const TextStyle(
        fontFamily: AppFonts.robotoRegular,
        fontSize: AppDimens.subTextSize,
        color: AppColors.cPrimaryColor
      );
    });
  }

  @override
  void dispose() {
    focusPass.removeListener(onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardAppearance: AppColors.cPrimaryBrightness,
          cursorColor: widget.cursorColor,
          textAlign: widget.textAlign,
          enabled: widget.enabled,
          controller: widget.textEditingController,
        //  initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          minLines: widget.maxLines,
          obscureText: widget.obscureText,
          autofocus: widget.autoFocus,
          focusNode: widget.focusNode,
          keyboardType: widget.textInputType,
          style: widget.fieldStyle,
          decoration: InputDecoration(
            isDense: widget.dense,
            filled: widget.filled,
            fillColor: widget.fillColor,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            errorStyle: widget.errorStyle,
            prefixText: (widget.isPrefix)? widget.prefixText :'',
            prefixStyle: widget.prefixTextStyle,
            prefixIcon: (widget.isPrefixIcon) ? widget.prefixIcon : null,
            icon: (widget.isIcon) ? widget.icon : null,
            contentPadding: widget.contentPadding,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle,
            suffixIconConstraints: widget.suffixIconConstraints,
            suffixIcon: (widget.isSuffixIcon) ? widget.suffixIcon : null,
            focusColor: widget.focusColor,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(
                  width: 0.5,
                  color: widget.borderColor,
                  style: widget.isBorder
                      ? BorderStyle.solid
                      : BorderStyle.none
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(
                  width: 0.5,
                  color: widget.errorBorderColor,
                  style: widget.isBorder
                      ? BorderStyle.solid
                      : BorderStyle.none
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(
                  width: 0.9,
                  color: widget.focusBorderColor,
                  style: widget.isBorder
                      ? BorderStyle.solid
                      : BorderStyle.none
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(
                  width: 0.5,
                  color: widget.borderColor,
                  style: widget.isBorder
                      ? BorderStyle.solid
                      : BorderStyle.none
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius,
              borderSide: BorderSide(
                  width: 0.5,
                  color: widget.borderColor,
                  style: widget.isBorder
                      ? BorderStyle.solid
                      : BorderStyle.none
              ),
            ),
            labelText: widget.label,
            labelStyle: widget.labelStyle,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          obscuringCharacter: widget.obscuringCharacter,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatter,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
