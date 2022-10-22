import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class ButtomSignup extends StatelessWidget {
  VoidCallback? ontap;
  ButtomSignup({this.ontap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have on account?",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          child: const Text(
            'Sing up?',
            style: TextStyle(
                color: kColors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: ontap,
        ),
      ],
    );
  }
}
