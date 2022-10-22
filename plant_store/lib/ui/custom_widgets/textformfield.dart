import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class TextFormFields extends StatelessWidget {
  String hintText;
  Icon pIcon;
  Icon? sIcon;
  TextFormFields({required this.hintText, required this.pIcon, this.sIcon});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColors.textFormColor,
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(top: 15), // add padding to adjust text
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kColors.mainColor,
            fontSize: 15,
          ),
          prefixIcon: pIcon,
          suffixIcon: sIcon,
        ),
      ),
    );
  }
}
