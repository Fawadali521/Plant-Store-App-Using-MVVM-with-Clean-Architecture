import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:green_tree/core/utils/constant/kcolors.dart';

class kTextStyle {
  final smallBoldText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: kColors.mainColor,
  );
  final smallGreyText = const TextStyle(
    color: kColors.greyColor,
    fontSize: 15.0,
  );
}
