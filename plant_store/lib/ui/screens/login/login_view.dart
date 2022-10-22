import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/buttom_signup.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:green_tree/ui/custom_widgets/my_custom_clipper.dart';
import 'package:green_tree/ui/custom_widgets/sign_button.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

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
              SizedBox(
                height: 20.h,
              ),
              MainText(
                  largeText: 'Welcome back',
                  smallText: 'Login to your account'),
              Form(
                child: Column(
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
                      hintText: 'Password',
                      sIcon: Icon(
                        Icons.lock,
                        color: kColors.mainColor,
                      ),
                      pIcon: Icon(null),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Checkbox(
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
                          ), //
                          Text(
                            'Remember me',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 75.h,
                          ),
                          Text(
                            'Forget Password?',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SignButton(signText: 'Login'),
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
