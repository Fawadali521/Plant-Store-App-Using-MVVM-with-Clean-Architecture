import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/core/utils/constant/ktext_style.dart';
import 'package:green_tree/ui/custom_widgets/buttom_signup.dart';
import 'package:green_tree/ui/custom_widgets/custom_icon.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:green_tree/ui/custom_widgets/sign_button.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';
import 'package:green_tree/ui/screens/login/login_view.dart';

class SignupView extends StatelessWidget {
  static const routeName = '/signup-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Positioned(
                left: 0,
                child: CustomIcon(
                    color: kColors.greyColor,
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
              ),
              SizedBox(height: 60.h),
              MainText(
                  largeText: 'Register', smallText: 'Create your new account'),
              SizedBox(height: 20.h),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFields(
                      hintText: 'Full Name',
                      sIcon: Icon(null),
                      pIcon: Icon(
                        Icons.person,
                        color: kColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextFormFields(
                      hintText: 'absd@gmail.com',
                      sIcon: Icon(null),
                      pIcon: Icon(
                        Icons.email,
                        color: kColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextFormFields(
                      hintText: 'Password',
                      sIcon: Icon(null),
                      pIcon: Icon(
                        Icons.lock,
                        color: kColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextFormFields(
                      hintText: 'Confirm Password',
                      sIcon: Icon(null),
                      pIcon: Icon(
                        Icons.lock,
                        color: kColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 15),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: kTextStyle().smallBoldText,
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'By signing you agree to our ',
                                ),
                                TextSpan(
                                    text: 'Team of use ',
                                    style: kTextStyle().smallGreyText),
                                const TextSpan(
                                  text: 'and ',
                                ),
                                TextSpan(
                                  text: 'privacy notice',
                                  style: kTextStyle().smallGreyText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    SignButton(
                      signText: 'Sign Up',
                      onpressed: () {
                        Navigator.of(context).pushNamed(
                          LoginView.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              ButtomSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
