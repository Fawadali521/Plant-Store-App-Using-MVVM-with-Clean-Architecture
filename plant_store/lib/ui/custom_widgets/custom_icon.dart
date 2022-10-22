import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class ArrowBackIcon extends StatelessWidget {
  final Color color;
  final Icon icon;
  ArrowBackIcon({required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: icon,
    );
  }
}
