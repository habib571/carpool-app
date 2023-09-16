import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DottedLine extends StatefulWidget {
  const DottedLine({Key? key, 
    this.lineColor = AppColors.cBackgroundColor,
    this.contentMargin = const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
  }) : super(key: key);

  final Color lineColor;
  final EdgeInsets contentMargin;

  @override
  State<DottedLine> createState() => _DottedLineState();
}

class _DottedLineState extends State<DottedLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.circle,size: 12,color: AppColors.cGreenColor,),
        Expanded(
          child: Container(
            width: 1,
            margin: widget.contentMargin,
            decoration: DottedDecoration(
                color: widget.lineColor,
                shape: Shape.line,
                linePosition: LinePosition.right
            ),
          ),
        ),
        const Icon(Icons.circle,size: 18,color: AppColors.cAccentColor,),
      ],
    );
  }
}
