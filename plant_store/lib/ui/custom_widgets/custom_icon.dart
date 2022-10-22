import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  final Color color;
  final Icon icon;
  CustomIcon({required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: icon,
    );
  }
}
