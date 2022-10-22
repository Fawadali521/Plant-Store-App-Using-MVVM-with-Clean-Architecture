import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/buttom_signup.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:green_tree/ui/custom_widgets/sign_button.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              MainText(
                  largeText: 'Register', smallText: 'Create your new account'),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFields(
                      hintText: 'Full Name',
                      sIcon: Icon(
                        Icons.person,
                        color: kColors.mainColor,
                      ),
                      pIcon: Icon(null),
                    ),
                    TextFormFields(
                      hintText: 'absd@gmail.com',
                      sIcon: Icon(
                        Icons.email,
                        color: kColors.mainColor,
                      ),
                      pIcon: Icon(null),
                    ),
                    TextFormFields(
                      hintText: 'Password',
                      sIcon: const Icon(
                        Icons.lock,
                        color: kColors.mainColor,
                      ),
                      pIcon: Icon(null),
                    ),
                    TextFormFields(
                      hintText: 'Confirm Password',
                      sIcon: const Icon(
                        Icons.lock,
                        color: kColors.mainColor,
                      ),
                      pIcon: Icon(null),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 15),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'By signing you agree to our ',
                                ),
                                TextSpan(
                                    text: 'Team of use ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const TextSpan(
                                  text: 'and ',
                                ),
                                TextSpan(
                                    text: 'privacy notice',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    SignButton(signText: 'Sign Up'),
                  ],
                ),
              ),
              ButtomSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
