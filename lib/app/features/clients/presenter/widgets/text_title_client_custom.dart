import 'package:flutter/material.dart';

import '../../../../core/utils/const/strings_colors.dart';

class TextTitleClientCustom extends StatelessWidget {
  final String text;
  final Color? color;
  final double width;
  const TextTitleClientCustom({
    Key? key,
    required this.width,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? StringColors.pinkClear,
        fontSize: width * 0.020,
      ),
    );
  }
}
