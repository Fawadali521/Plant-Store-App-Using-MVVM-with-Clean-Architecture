import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/core/utils/constant/ktext_style.dart';
import 'package:green_tree/ui/custom_widgets/custom_icon.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';
import 'package:provider/provider.dart';
import '../../../core/services/data/cat_data.dart';
import 'package:green_tree/ui/custom_widgets/custom_tab_bar.dart';

import '../../custom_widgets/simple_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/home-view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: Consumer<CartData>(
        builder: (context, model, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                color: kColors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/girl.jpg'),
                            ),
                          ),
                        ),
                        CustomIcon(
                          color: kColors.mainColor,
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: kColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text("Let's find your plants!",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 15.h),
                    TextFormFields(
                      hintText: 'Search Plant',
                      pIcon: const Icon(
                        Icons.search,
                        color: kColors.mainColor,
                      ),
                      sIcon: const Icon(
                        Icons.keyboard_voice_sharp,
                        color: kColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kColors.textFormColor),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.bodySmall,
                          controller: tabController,
                          labelColor: kColors.mainColor,
                          unselectedLabelColor: kColors.greyColor,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: model.tab[0],
                            ),
                            Tab(
                              text: model.tab[1],
                            ),
                            Tab(
                              text: model.tab[2],
                            ),
                            Tab(
                              text: model.tab[3],
                            ),
                          ]),
                    ),
                    CustomTabBar(controller: tabController),
                    SizedBox(height: 10.h),
                    SimpleText(
                      text: 'Recent Viewed',
                      color: kColors.mainColor,
                      fontweight: FontWeight.bold,
                      fontsize: 20,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: model.cartData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60.h,
                              width: 220.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //margin: const EdgeInsets.only(right: 50.0),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kColors.recentBackColor,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              model.cartData[index].imageUrl),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(model.cartData[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(model.cartData[index].description,
                                          style: kTextStyle().smallGreyText),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  elevation: 10,
                  unselectedFontSize: 0,
                  selectedFontSize: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: kColors.whiteColor,
                  selectedItemColor: kColors.mainColor,
                  unselectedItemColor: kColors.greyColor,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        label: ('person'), icon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        label: ('shoppingCart'),
                        icon: Icon(Icons.shopping_cart)),
                    BottomNavigationBarItem(
                        label: ('list'), icon: Icon(Icons.list_alt_rounded)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
