import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final FontWeight fontweight;
  final double fontsize;
  final Color color;
  SimpleText(
      {required this.text,
      required this.color,
      required this.fontweight,
      required this.fontsize});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontsize,
          color: color,
          fontWeight: fontweight,
        ));
  }
}
