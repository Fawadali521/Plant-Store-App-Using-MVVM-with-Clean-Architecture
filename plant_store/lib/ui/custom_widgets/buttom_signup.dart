import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/screens/signup/signup_view.dart';
import 'package:green_tree/ui/screens/signup/signup_view.dart';

import '../screens/product_details_section/product_details_view.dart';

class ButtomSignup extends StatelessWidget {
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
          onTap: () {
            Navigator.of(context).pushNamed(
              SignupView.routeName,
            );
          },
          child: const Text(
            'Sing up?',
            style: TextStyle(
                color: kColors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
