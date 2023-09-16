import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class PinEntryTextField extends StatefulWidget {
  const PinEntryTextField({Key? key, 
    this.lastPin,
    this.fields = 4,
    this.fieldWidth = 65.0,
    this.fontSize = 28.0,
    this.isTextObscure = false,
    this.showFieldAsBox = true
  }) : assert(fields > 0), super(key: key);

  final String? lastPin;
  final int fields;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;
  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.fields, null);
    _focusNodes = List<FocusNode?>.filled(widget.fields, null);
    _textControllers = List<TextEditingController?>.filled(widget.fields, null);
    // _pin = List<String>(widgets.fields);
    // _focusNodes = List<FocusNode>(widgets.fields);
    // _textControllers = List<TextEditingController>(widgets.fields);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (int i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t!.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    final List<Widget> textFields =
        List<Widget>.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    for (var tEditController in _textControllers) {
      tEditController!.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });



    return Container(
      width: widget.fieldWidth,
      height: widget.fieldWidth,
      margin: const EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: AppColors.cPrimaryColor,
            fontSize: widget.fontSize,
            fontFamily: AppFonts.robotoRegular
        ),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          counterText: '',
          enabledBorder: widget.showFieldAsBox ?
          OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.8,
                  color: AppColors.cBorderColor
              ),
              borderRadius: BorderRadius.circular(20.0)
          ) : null,
          focusedBorder:widget.showFieldAsBox ?
          OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.8,
                  color: AppColors.cAccentColor
              ),
              borderRadius: BorderRadius.circular(20.0)
          ) : null,
          border: widget.showFieldAsBox ?
          OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.8,
                  color: AppColors.cBorderColor
              ),
              borderRadius: BorderRadius.circular(20.0)
          ) : null,
        ),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {}
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {}
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}
