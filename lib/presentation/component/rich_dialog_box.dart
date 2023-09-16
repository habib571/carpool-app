import 'package:flutter/material.dart';

class RichDialogBox extends StatefulWidget {
  const RichDialogBox({super.key, 
    required this.title,
    this.titleStyle = const TextStyle(
      color: Colors.black,
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
  _RichDialogBoxState createState() => _RichDialogBoxState();
}

class _RichDialogBoxState extends State<RichDialogBox> {

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
              margin: const EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: widget.titlePadding,
                        child: Text(
                          widget.title,
                          style: widget.titleStyle,
                        ),
                      ),
                      widget.form != null ? widget.form! : const SizedBox(height: 0,),
                      widget.content != null ? widget.content! : const SizedBox(height: 0,),
                    ],
                  ),
                  (widget.actions != null) ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  widget.actions!
                  ) : const SizedBox(height: 0,),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/icons/info_icon.png',
                width: 70,
                height: 70,
              ),
            ),
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
