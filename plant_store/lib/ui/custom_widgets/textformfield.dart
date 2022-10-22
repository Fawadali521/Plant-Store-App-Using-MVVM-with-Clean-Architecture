import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class TextFormFields extends StatelessWidget {
  String hintText;
  Icon pIcon;
  Icon? sIcon;
  TextFormFields({required this.hintText, required this.pIcon, this.sIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Card(
        margin: EdgeInsets.all(10),
        color: kColors.textFormColor,
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(top: 15), // add padding to adjust text
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: kColors.mainColor,
              fontSize: 15,
            ),
            prefixIcon: pIcon,
            suffixIcon: sIcon,
          ),
        ),
      ),
    );
  }
}
