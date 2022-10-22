import 'package:flutter/material.dart';
import 'package:green_tree/core/services/data/cat_data.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/screens/home_section/home_view.dart';
import 'package:green_tree/ui/screens/login/login_view.dart';
import 'package:green_tree/ui/screens/product_details_section/product_details_view.dart';
import 'package:green_tree/ui/screens/signup/signup_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (BuildContext context) => CartData(),
            child: MaterialApp(
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  textTheme: Theme.of(context).textTheme.copyWith(
                        bodySmall: const TextStyle(
                          color: kColors.greyColor,
                          fontSize: 20.0,
                        ),
                        bodyMedium: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kColors.mainColor,
                        ),
                        bodyLarge: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: kColors.mainColor,
                        ),
                      ),
                  primarySwatch: Colors.purple,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    secondary: Colors.deepOrange, // Your accent color
                  ),
                ),
                home: HomeView(),
                routes: {
                  ProductDetailsView.routeName: (context) =>
                      ProductDetailsView(),
                }),
          );
        });
  }
}
