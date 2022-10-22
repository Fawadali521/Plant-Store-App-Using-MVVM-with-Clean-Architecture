import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/buttom_signup.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:green_tree/ui/custom_widgets/my_custom_clipper.dart';
import 'package:green_tree/ui/custom_widgets/sign_button.dart';
import 'package:green_tree/ui/custom_widgets/simple_text.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';
import 'package:green_tree/ui/screens/home_section/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool value = false;

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
              //login top image
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: 270.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/top.jpg'),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    //text on login page
                    MainText(
                        largeText: 'Welcome back',
                        smallText: 'Login to your account'),
                    SizedBox(height: 15.h),
                    //form for input to login
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormFields(
                            hintText: 'Full Name',
                            sIcon: const Icon(null),
                            pIcon: const Icon(
                              Icons.person,
                              color: kColors.mainColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          TextFormFields(
                            hintText: 'Password',
                            sIcon: const Icon(null),
                            pIcon: const Icon(
                              Icons.lock,
                              color: kColors.mainColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: kColors.whiteColor,
                                activeColor: kColors.mainColor,
                                shape: CircleBorder(),
                                value: this.value,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              SimpleText(
                                text: 'Remember me',
                                color: kColors.greyColor,
                                fontweight: FontWeight.normal,
                                fontsize: 15,
                              ),
                              const Spacer(),
                              SimpleText(
                                text: 'Forget Password?',
                                color: kColors.mainColor,
                                fontweight: FontWeight.bold,
                                fontsize: 15,
                              ),
                            ],
                          ),
                          SizedBox(height: 80.h),
                          SignButton(
                            signText: 'Login',
                            onpressed: () {
                              Navigator.of(context).pushNamed(
                                HomeView.routeName,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
