import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainText extends StatelessWidget {
  final String largeText;
  final String smallText;
  MainText({required this.largeText, required this.smallText});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right: 5,
            child: Container(
              height: 60.h,
              width: 60.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/leaf2.jpg'),
                ),
              ),
            )),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(largeText, style: Theme.of(context).textTheme.bodyLarge),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(smallText,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
