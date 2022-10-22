import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class SignButton extends StatelessWidget {
  final String signText;
  VoidCallback onpressed;
  SignButton({required this.signText, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(signText),
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: kColors.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          minimumSize: Size(50, 50)),
    );
  }
}
