import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class SignButton extends StatelessWidget {
  final String signText;
  SignButton({required this.signText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ElevatedButton(
        child: Text(signText),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: kColors.mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minimumSize: Size(50, 50)),
      ),
    );
  }
}
